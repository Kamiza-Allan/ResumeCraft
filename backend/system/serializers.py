from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Resume

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password']

    def create(self, validated_data):
        # This helper function handles the encryption for us
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data.get('email', ''),
            password=validated_data['password']
        )
        return user

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