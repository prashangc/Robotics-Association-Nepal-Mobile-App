from rest_framework import serializers
from .models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

User = get_user_model()

#Screen Titles
class TitlesSerializers(serializers.ModelSerializer):
    class Meta:
        model = ScreenTitle
        fields = ['id', 'title']

#Services Titles
class ServicesTitlesSerializers(serializers.ModelSerializer):
    class Meta:
        model = ServicesTitle
        fields = ['id', 'title']


#Image Slider
class ImageSliderSerializers(serializers.ModelSerializer):
    class Meta:
        model = ImageSlider
        fields = "__all__"


#Stats Details
class StatsDetailsSerializers(serializers.ModelSerializer):
    class Meta:
        model = StatsDetail
        fields = "__all__"



#Login and Registration
class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {"write_only":True, 'required': True}}
    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)      
        Token.objects.create(user=user)
        return user 