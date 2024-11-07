from rest_framework.response import Response
from rest_framework.decorators import api_view, action
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import user_passes_test
from django.http import JsonResponse
from api.serializer import *
from members.models import *
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework import generics
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework_simplejwt.views import TokenObtainPairView
from likes.models import Like
from api.models import Users, RefreshTokenModel
from api.serializer import UsersSerializer
from django.utils import timezone
from vacations.models import VacationModel,Country
from api.permissions import IsAdminUser
from django.db.models import Count
from django.db import connection
class StatsViewSet(viewsets.ViewSet):

    permission_classes=[IsAuthenticated, IsAdminUser]


    @action(detail=False, methods=['get'])
    def total_users(self, request):
        try:
            count = Users.objects.all().count()
            return Response({"total_users": count})
        except Exception as err: 
            json = {"error":str(err)}
            return Response(json, status = status.HTTP_500_INTERNAL_SERVER_ERROR)


    @action(detail=False, methods=['get'])
    def likes_mapping(self, request):
        try:
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT c.country_name, COUNT(l.userId) AS likes
                    FROM likes AS l
                    JOIN vacations AS v ON l.vacation_id = v.vacation_id
                    JOIN countires AS c ON v.country_id = c.country_Id
                    GROUP BY c.country_name
                """)
                result = cursor.fetchall()
        
            return Response([{"destination": dest, "likes": likes} for dest, likes in result])
        except Exception as err: 
            json = {"error":str(err)}
            return Response(json, status = status.HTTP_500_INTERNAL_SERVER_ERROR)




    @action(detail=False, methods=['get'])
    def total_likes(self, request):
        try:
            count = Like.objects.all().count()
            return Response({"total_likes": count})
        except Exception as err: 
            json = {"error":str(err)}
            return Response(json, status = status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(detail=False, methods=["get"])
    def enumerate_vacations(self, request):
        try:
            current_date = timezone.now().date()

            # Filter vacations where the current date is between vacation_date_start and vacation_date_end
            vacations_ongoing = VacationModel.objects.filter(
                vacation_date_start__lte=current_date,
                vacation_date_end__gte=current_date
            ).count()
            vacations_ended = VacationModel.objects.filter(
                vacation_date_end__lte=current_date
            ).count()
            vacations_future = VacationModel.objects.filter(
                vacation_date_start__gte=current_date
            ).count()
            return Response({ "past_vacations": vacations_ended, "on_going_vacations": vacations_ongoing, "future_vacations": vacations_future })
        except Exception as err: 
            json = {"error":str(err)}
            return Response(json, status = status.HTTP_500_INTERNAL_SERVER_ERROR)


class AuthViewSet(viewsets.ViewSet):
    permission_classes = [AllowAny]  # Default permission for all actions


    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def register(self, request):
        """Register a new user."""
        serializer = UsersSerializer(data=request.data)
        if serializer.is_valid():
            # Use the custom manager to create the user
            user = Users.objects.create_user(
                **serializer.validated_data,
            )
            return Response({"user": serializer.data}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'], permission_classes=[IsAuthenticated])
    def user_details(self, request):
        """Get the authenticated user's information."""
        serializer = UsersSerializer(request.user)
        return Response(serializer.data)

    @action(detail=False, methods=['post'], permission_classes=[IsAuthenticated])
    def logout(self, request):
        """ Logs out the user by removing the refresh tokens existing for him"""

        RefreshTokenModel.objects.filter(user=request.user).delete()
        return Response({"message": "logged out successfully"})


class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

def post(self, request, *args, **kwargs):
        print(request.data)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # Save refresh token to the user model or wherever needed
        user_email = request.data.get('email')
        refresh = serializer.validated_data['refresh']
        
        try:
            # Get the user by email
            user = Users.objects.get(email=user_email)

            # Delete any existing refresh tokens for the user
            RefreshTokenModel.objects.filter(user=user).delete()

            # Create a new refresh token record
            RefreshTokenModel.objects.create(
                user=user,
                token=refresh
            )
        except Users.DoesNotExist:
            return Response({"error": "User not found"}, status=status.HTTP_404_NOT_FOUND)

        # Generate the access and refresh tokens
        access = serializer.validated_data['access']
        
        # Return the tokens
        return Response({
            'access': access,
            'refresh': refresh
        }, status=status.HTTP_200_OK)
       
