from django.shortcuts import render
from django.db import IntegrityError
# Create your views here.
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from .models import Vacation, Like, Users

def add_like(request, vacation_id):
    user_id = request.users.userId  # Assuming user is authenticated

    # Get the user and vacation instances
    user = get_object_or_404(Users, id=user_id)
    vacation = get_object_or_404(Vacation, vacation_id=vacation_id)

    try:
        # Attempt to create a Like
        like = Like.objects.create(user=user, vacation=vacation)
        return JsonResponse({'message': 'Liked successfully!'}, status=201)
    except IntegrityError:
        return JsonResponse({'error': 'You have already liked this vacation.'}, status=400)