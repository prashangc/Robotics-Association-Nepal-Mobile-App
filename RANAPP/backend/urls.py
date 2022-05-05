from django.conf import settings
from django.urls import path, include
from rest_framework import routers
from .views import *
from django.conf.urls.static import static

from rest_framework.authtoken.views import obtain_auth_token



route = routers.DefaultRouter()
route.register('Services', ServicesViews)
route.register('Programs', ProgramsViews)
route.register('Projects', ProjectsViews)
route.register('Events', EventsViews)
route.register('Tenures', TenureViews)
route.register('Category', CategoryViews)
route.register('Membership', MembershipViews)


urlpatterns = [
    path('', include(route.urls)),
     path('api/token/auth/', CustomAuthToken.as_view())

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)