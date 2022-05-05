from rest_framework import serializers
from .models import Categorymember, ProjectDetail , EventDetail , ServiceDetail , ProgramDetail, TenureDetail, membership



class Projectserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = ProjectDetail
        fields = '__all__'


class Eventserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = EventDetail
        fields = '__all__'


class Serviceserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = ServiceDetail
        fields = '__all__'



class Programserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = ProgramDetail
        fields = '__all__'


class Tenureserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = TenureDetail
        fields = '__all__'
class Categoryserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Categorymember
        fields = '__all__'


class Memberserializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = membership
        fields = '__all__'