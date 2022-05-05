from rest_framework import serializers
from .models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

User = get_user_model()


#Services Titles
class ServicesTitlesSerializers(serializers.ModelSerializer):
    class Meta:
        model = ServicesTitle
        fields = ['id', 'title', 'icons']

#Project Titles
class ProjectTitlesSerializers(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ['id', 'title', 'project_icons']


#Image Slider
class ImageSliderSerializers(serializers.ModelSerializer):
    class Meta:
        model = ImageSlider
        fields = "__all__"

#Program Details
class ProgramDetailsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Program
        fields = "__all__"


#Stats Details
class StatsDetailsSerializers(serializers.ModelSerializer):
    class Meta:
        model = StatsDetail
        fields = "__all__"

#Year Category
class YearSerializers(serializers.ModelSerializer):
    class Meta:
        model = Year
        fields = ['id', 'year']


class MemberCategorySerializers(serializers.ModelSerializer):
    class Meta:
        model = MemberCategory
        fields = ['id', 'category']

#Members Category
class MembersSerializers(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = ['id', 'year_category', 'member_category', 'name', 'picture', 'position']




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