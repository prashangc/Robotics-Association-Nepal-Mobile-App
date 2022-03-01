from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class ImageSlider(models.Model):
    pictures = models.ImageField(upload_to="my_picture",blank=True)

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
    year_title = models.CharField(max_length=150)
    def __str__(self):
        return self.year_title


class Member(models.Model):
    year = models.ForeignKey(Year,models.CASCADE)
    name = models.CharField(max_length=150)
    picture = models.ImageField(upload_to="members_images",blank=True)
    position = models.CharField(max_length=150)

    def __str__(self):
        return self.name        