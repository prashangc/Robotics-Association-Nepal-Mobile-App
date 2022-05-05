from rest_framework import viewsets

# from backend.forms import membershipform
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from .serializers import Categoryserializer, Eventserializer, Memberserializer, Programserializer, Projectserializer, Serviceserializer, Tenureserializer
from.models import Categorymember, ServiceDetail , ProjectDetail ,ProgramDetail ,EventDetail, TenureDetail, membership
from rest_framework.permissions import IsAuthenticated  # <-- Here

# Create your views here.
#for services


class ServicesViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = ServiceDetail.objects.all() 
    serializer_class = Serviceserializer

# For Projects Titles
class ProjectsViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = ProjectDetail.objects.all() 
    serializer_class = Projectserializer

# For Programs Titles
class ProgramsViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = ProgramDetail.objects.all() 
    serializer_class = Programserializer

# For Events Titles
class EventsViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = EventDetail.objects.all() 
    serializer_class = Eventserializer

class TenureViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = TenureDetail.objects.all() 
    serializer_class = Tenureserializer
    
class CategoryViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = Categorymember.objects.all() 
    serializer_class = Categoryserializer

class MembershipViews(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    queryset = membership.objects.all() 
    serializer_class = Memberserializer

from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response

class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
            'email': user.email
        })

    