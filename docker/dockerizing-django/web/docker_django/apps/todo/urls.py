from django.conf.urls import url
# from rest_framework import routers
from . import views

# Routers provide an easy way of automatically determining the URL conf.
# router = routers.DefaultRouter()
# router.register(r'zonemodels', ZoneModelViewSet)

urlpatterns = [
    url(r'^$', views.home, name='home'),
]
