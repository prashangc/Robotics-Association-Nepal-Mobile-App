from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class ImageSlider(models.Model):
    pictures = models.ImageField(upload_to="image_slider",blank=True)

class ServicesTitle(models.Model):
    title = models.CharField(max_length=100)
    icons = models.ImageField(upload_to="services_icon",blank=True)
    def __str__(self):
        return self.title       

class Project(models.Model):
    title = models.CharField(max_length=100)
    project_icons = models.ImageField(upload_to="projects_icon",blank=True)
    def __str__(self):
        return self.title   

class Program(models.Model):
    title = models.CharField(max_length=100)
    program_icons = models.ImageField(upload_to="programs_icon",blank=True)
    def __str__(self):
        return self.title           

class StatsDetail(models.Model):
    stats_name = models.CharField(max_length=100)
    stats_value = models.CharField(max_length=100)
    stats_icons = models.ImageField(upload_to="stats_icon",blank=True)
    def __str__(self):
        return self.stats_name 

class Year(models.Model):
    year = models.CharField(max_length=150)
    def __str__(self):

        return self.year
        # return f"Year = {self.year_title} and Member Category = {self.member_category}"

class MemberCategory(models.Model):
    category = models.CharField(max_length=150)  
    def __str__(self):
        return self.category



class Member(models.Model):
    year_category = models.ForeignKey(Year,models.CASCADE)
    member_category = models.ForeignKey(MemberCategory,models.CASCADE)
    name = models.CharField(max_length=150)
    picture = models.ImageField(upload_to="members_images",blank=True)
    position = models.CharField(max_length=150)

    def __str__(self):
        return self.name        