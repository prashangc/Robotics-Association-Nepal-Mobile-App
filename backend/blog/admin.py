from django.contrib import admin
from .models import ImageSlider, ServicesTitle, StatsDetail, Project, Program, Year, Member

# Register your models here.

# the model-table created in the model should be registered here because when the 
# admin logins on the backend server, the admin should be able to see the tables 


class ServicesTitleAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'icons'] # this will be visible in the admin panel

class ProjectTitleAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'project_icons'] # this will be visible in the admin panel

class ImageSliderAdmin(admin.ModelAdmin):
    list_display = ['id', 'pictures'] # this will be visible in the admin panel

class StatsAdmin(admin.ModelAdmin):
    list = ['id', 'statsName', 'statsValue', 'stats_icons'] # this will be visible in the admin panel

class ProgramsAdmin(admin.ModelAdmin):
    list = ['id', 'title', 'program_icons'] # this will be visible in the admin panel


class YearAdmin(admin.ModelAdmin):
    list = ['id', 'title'] 

class MemberAdmin(admin.ModelAdmin):
    list = ['id', 'name', 'position', 'picture']     

admin.site.register(ImageSlider, ImageSliderAdmin)
admin.site.register(ServicesTitle, ServicesTitleAdmin)
admin.site.register(StatsDetail, StatsAdmin)
admin.site.register(Project, ProjectTitleAdmin)
admin.site.register(Program, ProgramsAdmin)
admin.site.register(Year, YearAdmin)
admin.site.register(Member, MemberAdmin)





