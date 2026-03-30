from django.urls import path
from .views import ResumeListCreateView, ResumeDetailView, RegisterView, AISuggestionView, ExportResumePDFView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='auth_register'), # New
    path('resumes/', ResumeListCreateView.as_view(), name='resume-list-create'),
    path('resumes/<int:pk>/', ResumeDetailView.as_view(), name='resume-detail'),
    # AI Endpoint
    path('ai/suggest/', AISuggestionView.as_view(), name='ai_suggest'),
    # PDF Export Endpoint
    path('resumes/<int:pk>/export/', ExportResumePDFView.as_view(), name='resume_export'),
]