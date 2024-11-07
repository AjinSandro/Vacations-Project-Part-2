from rest_framework.serializers import ModelSerializer
from vacations.models import VacationModel
from api.models import Users
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
class UsersSerializer(ModelSerializer):
    class Meta:
        model = Users
        fields = "__all__"
        extra_kwargs = {"password": {"write_only": True}}

class VacationSerializer(ModelSerializer):
    class Meta:
        model = VacationModel
        fields = "__all__"


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        return token
       