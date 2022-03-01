from django.urls import path, include
from rest_framework import routers
from .views import *
from rest_framework.authtoken.views import obtain_auth_token



route = routers.DefaultRouter()
route.register('services', ServicesTitlesList)
route.register('images', ImageSliderList)
route.register('stats', StatsList)
route.register('projects', ProjectsTitlesList)
route.register('programs', ProgramsTitlesList)
route.register('year', YearList)
route.register('members', MembersList)







urlpatterns = [
    path('login/', obtain_auth_token),
    path('register/', Registernow.as_view()),
    path('', include(route.urls)),
]
