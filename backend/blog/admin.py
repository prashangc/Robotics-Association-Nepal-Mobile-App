from django.contrib import admin
from .models import ScreenTitle, ImageSlider, ServicesTitle, StatsDetail

# Register your models here.

# the model-table created in the model should be registered here because when the 
# admin logins on the backend server, the admin should be able to see the tables 

class ScreenTitleAdmin(admin.ModelAdmin):
    list_display = ['id', 'title'] # this will be visible in the admin panel

class ServicesTitleAdmin(admin.ModelAdmin):
    list_display = ['id', 'title'] # this will be visible in the admin panel

class ImageSliderAdmin(admin.ModelAdmin):
    list_display = ['id', 'pictures'] # this will be visible in the admin panel

class StatsAdmin(admin.ModelAdmin):
    list = ['id', 'statsName', 'statsValue'] # this will be visible in the admin panel

admin.site.register(ScreenTitle, ScreenTitleAdmin)
admin.site.register(ImageSlider, ImageSliderAdmin)
admin.site.register(ServicesTitle, ServicesTitleAdmin)
admin.site.register(StatsDetail, StatsAdmin)

