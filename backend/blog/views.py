from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from .serializers import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication 
from .models import ScreenTitle, ImageSlider, ServicesTitle, StatsDetail
# from rest_framework.generics import ListAPIView

# Create your views here.


# For Screen Titles
class TitlesList(viewsets.ModelViewSet):
    queryset = ScreenTitle.objects.all() 
    serializer_class = TitlesSerializers

# For Services Titles
class ServicesTitlesList(viewsets.ModelViewSet):
    queryset = ServicesTitle.objects.all() 
    serializer_class = ServicesTitlesSerializers

# For Stats Titles
class StatsList(viewsets.ModelViewSet):
    queryset = StatsDetail.objects.all() 
    serializer_class = StatsDetailsSerializers


class ImageSliderList(viewsets.ModelViewSet):    
    queryset = ImageSlider.objects.all() 
    serializer_class = ImageSliderSerializers
    # def post(self,request):
    #     serializer = ImageSliderSerializers(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response({'message': 'done'})
    #     return Response(serializer.errors)

    # def get(self,request):
    #     data = ImageSlider.objects.all() # get all objects of the model
    #     serializer = ImageSliderSerializers(data,many=True)
    #     return Response(serializer.data)

# For Registration
class Registernow(APIView):
    def post(self,request):
        serializers = UserSerializers(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response({'error': False}) 
        return Response({'error': True}) 
    