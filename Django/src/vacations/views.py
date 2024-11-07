from django.http import Http404
from django.shortcuts import render,redirect
from vacations.models import *
from django.contrib.auth.decorators import login_required ,permission_required

def vacation_list(request):
    vacations = VacationModel.objects.all()
    context = {"active":"vacations","vacations":vacations}
    return render(request,"vacations.html",context)

def vacation_details(request,vacation_id):
    try:
        vacation = VacationModel.objects.get(pk=vacation_id) # pk = primary key
        context = {"active": "vacations" , "vacation" : vacation}
        return render(request,"details.html", context)
    except VacationModel.DoesNotExist:
        raise Http404()

@login_required(login_url="login_route")
def insert_vacation(request):
    if request.method =="GET":
        context = {"active":"insert", "form":VacationForm()}
        return render(request, "insert.html", context)
    
    form = VacationForm(request.POST)
    if not form.is_valid():
        context = {"form":form}
        return render(request, "insert.html",context)
    form.save() 
    return redirect("vacation_route")

def edit(request,vacation_id):
    try:
        if request.method == "GET":
            vacation = VacationModel.objects.get(pk=vacation_id)
            context = {"form":VacationForm(instance=vacation)}
            return render(request, "edit.html",context)
        vacation = VacationModel.objects.get(pk=vacation_id)
        form = VacationForm(request.POST,instance=vacation)
        form.save()
        return redirect("vacation_route")
    except VacationModel.DoesNotExist:
        raise Http404()

@permission_required("is_superuser",login_url="login_route")
def delete(request,vacation_id):
    try:
        if request.method == "GET":
            vacation = VacationModel.objects.get(pk=vacation_id)
            vacation.delete()
            return redirect("vacation_route")
    except VacationModel.DoesNotExist:
        raise Http404()