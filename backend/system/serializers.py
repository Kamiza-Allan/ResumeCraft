from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Resume

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class ResumeSerializer(serializers.ModelSerializer):
    # We use a StringRelatedField to show the username instead of just a User ID
    user = serializers.ReadOnlyField(source='user.username')

    class Meta:
        model = Resume
        fields = [
            'id', 
            'user', 
            'title', 
            'content', 
            'template_name', 
            'created_at', 
            'updated_at'
        ]