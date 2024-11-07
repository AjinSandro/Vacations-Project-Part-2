# accounts/permissions.py

from rest_framework.permissions import BasePermission
from api.models import Users
class IsAdminUser(BasePermission):
    def has_permission(self, request, view):
        user = Users.objects.filter(email=request.user.email).first()
        return request.user and user.role_type.Id == 1