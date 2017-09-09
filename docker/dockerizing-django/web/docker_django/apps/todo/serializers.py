from rest_framework import serializers, viewsets
from .models import ZoneModel


class ZoneModelSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ZoneModel
        fields = ('name', 'model')


# ViewSets define the view behavior.
class ZoneModelViewSet(viewsets.ModelViewSet):
    queryset = ZoneModel.objects.all()
    serializer_class = ZoneModelSerializer
