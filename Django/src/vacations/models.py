from django.db import models
from datetime import datetime
from django.db.models import Model, CharField, DecimalField, IntegerField, DateField, AutoField, FileField
from django.core.validators import MinLengthValidator , MaxLengthValidator, MinValueValidator,MaxValueValidator
from django.forms import ModelForm, TextInput , Select , NumberInput, DateInput

class Country(Model):
    country_Id = IntegerField(primary_key=True)
    country_name = CharField(max_length=300)

    class Meta:
        db_table="countires"
        managed=False

class VacationModel(Model):

    vacation_id = AutoField(primary_key=True)
    country_id = DecimalField(max_digits = 2 , decimal_places = 0,validators = (MinValueValidator(1), MaxValueValidator(99)))
    vacation_details = CharField(max_length=300, validators=(MinLengthValidator(2),MaxLengthValidator(300)))
    vacation_date_start = DateField()
    vacation_date_end = DateField()
    vacation_price = DecimalField(max_digits = 6 , decimal_places = 2 , validators = (MinValueValidator(1,"Price cannot be negative nor 0."),(MaxValueValidator(10000))))
    vacation_picture_file = CharField(max_length=300,null=True, blank=True, validators=(MinLengthValidator(5),MaxLengthValidator(300)))
    

    class Meta:
        db_table = "vacations"
