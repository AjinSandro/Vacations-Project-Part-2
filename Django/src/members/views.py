from django.shortcuts import render,redirect
from django.contrib.auth import login , logout ,authenticate
from .models import LoginForm, RegistrationForm
from django.contrib import messages

# Create your views here.

def Register(request):
    if request.method == "GET":
        context = {"active":"register","form":RegistrationForm()}
        return render(request,"register.html",context)
    
    form = RegistrationForm(request.POST)
    if not form.is_valid():
        context = {"active":"register","form":form}
        return render(request, "register.html",context)
    
    user = form.save()
    login(request,user)
    return redirect("home_route")

def user_login(request):
    if request.method == "GET":
        context = {"active":"login","form":LoginForm()}
        return render(request,"login.html",context)
    
    form = LoginForm(request.POST)
    if not form.is_valid():
        context = {"active":"login","form":form}
        return render(request,"login.html",context)
    
    user = authenticate(request,username=form.cleaned_data["email"],
                        password=form.cleaned_data["password"])

    if not user:
        messages.error(request,"incorrect email or password")
        context = {"active":"login","form":form}
        return render(request,"login.html",context)
    
    login(request,user)
    messages.success(request,"Welcome back" + user.firstname)
    return redirect("home_route")

def user_logout(request):
    logout(request)
    return redirect("home_route")