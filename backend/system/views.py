# Create your views here.
from rest_framework.views import APIView
from rest_framework import generics, permissions
from .models import Resume
from .serializers import ResumeSerializer
from django.contrib.auth.models import User
from rest_framework.permissions import AllowAny
from .serializers import UserSerializer
from .ai_utils import generate_resume_suggestions
from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML
import tempfile


class ResumeListCreateView(generics.ListCreateAPIView):
    serializer_class = ResumeSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # This ensures users ONLY see their own resumes
        return Resume.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        # Automatically attach the logged-in user to the new resume
        serializer.save(user=self.request.user)

class ResumeDetailView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ResumeSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Resume.objects.filter(user=self.request.user)

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,) # Anyone can access this to sign up
    serializer_class = UserSerializer        

class AISuggestionView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        # The Flutter app sends the current resume content in the request body
        content = request.data.get('content')
        
        if not content:
            return Response({"error": "No content provided"}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            suggestions = generate_resume_suggestions(content)
            return Response({"suggestions": suggestions}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class ExportResumePDFView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request, pk):
        try:
            resume = Resume.objects.get(pk=pk, user=request.user)
            
            # 1. Render our data into an HTML template
            context = {'resume': resume}
            html_string = render_to_string('system/resume_pdf.html', context)
            
            # 2. Create a temporary file to hold the PDF
            html = HTML(string=html_string)
            result = html.write_pdf()

            # 3. Send the PDF back to the browser/app
            response = HttpResponse(result, content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="{resume.title}.pdf"'
            return response
            
        except Resume.DoesNotExist:
            return Response({"error": "Resume not found"}, status=status.HTTP_404_NOT_FOUND)