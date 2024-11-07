
from django.urls import path
from . import views

urlpatterns = [
    path("",views.vacation_list, name="vacations_route"),
    path("details/<int:id>",views.vacation_details, name="details_route"),
    path("new",views.insert_vacation, name="insert_route"), 
    path("edit/<int:id>",views.edit, name="edit_route"),
    path("delete/<int:id>",views.delete, name="delete_route"), 
]   
