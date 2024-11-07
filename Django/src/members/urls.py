from . import views
from django.urls import path

urlpatterns = [
    path("register",views.Register, name="register_route"), 
    path("login",views.user_login, name="login_route"),
    path("logout",views.user_logout, name="logout_route"),
]   
