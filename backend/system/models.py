# Create your models here.
from django.db import models
from django.contrib.auth.models import User

class Resume(models.Model):
    # Link each resume to a specific user. If the user is deleted, their resumes are too.
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='resumes')
    # Basic info
    title = models.CharField(max_length=255, default="My Resume")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    # The Content (We will store this as JSON for flexibility with AI suggestions)
    # This will hold sections like Experience, Education, and Skills.
    content = models.JSONField(default=dict)
    
    # Template choice
    template_name = models.CharField(max_length=100, default='modern')

    def __str__(self):
        return f"{self.title} - {self.user.username}"