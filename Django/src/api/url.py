from django.urls import path
from . import views
from rest_framework_simplejwt.views import  TokenRefreshView

from django.urls import path, include

from rest_framework.routers import DefaultRouter
from .views import AuthViewSet, StatsViewSet, CustomTokenObtainPairView


routerAuth = DefaultRouter()
routerAuth.register(r'auth', AuthViewSet, basename='auth')
routerVacations = DefaultRouter()
routerVacations.register(r'stats', StatsViewSet, basename='stats')

urlpatterns = [
    path('token/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path("", include(routerAuth.urls)),
    path("", include(routerVacations.urls))
]