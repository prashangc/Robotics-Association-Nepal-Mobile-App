from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class ScreenTitle(models.Model):
    title = models.CharField(max_length=100)
    def __str__(self):
        return self.title     

class ImageSlider(models.Model):
    # image_name = models.CharField(max_length=100)
    pictures = models.ImageField(upload_to="my_picture",blank=True)
    # def __str__(self):
    #     return self.title     

class ServicesTitle(models.Model):
    title = models.CharField(max_length=100)
    def __str__(self):
        return self.title       

class StatsDetail(models.Model):
    stats_name = models.CharField(max_length=100)
    stats_value = models.CharField(max_length=100)
    def __str__(self):
        return self.stats_name 