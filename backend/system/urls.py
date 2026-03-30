from django.urls import path
from .views import ResumeListCreateView, ResumeDetailView, RegisterView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='auth_register'), # New
    path('resumes/', ResumeListCreateView.as_view(), name='resume-list-create'),
    path('resumes/<int:pk>/', ResumeDetailView.as_view(), name='resume-detail'),
]