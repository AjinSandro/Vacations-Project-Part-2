from django.db.models import Model, CharField, DecimalField, IntegerField, DateField, AutoField, FileField,EmailField
from django.db.models import ForeignKey
from django.db import models
from django.core.validators import MinLengthValidator , MaxLengthValidator, MinValueValidator,MaxValueValidator
from django.forms import EmailInput, ModelForm, PasswordInput, TextInput,ModelForm, TextInput,Select,NumberInput,DateInput
from django.contrib.auth.models import AbstractUser,AbstractBaseUser
from django.contrib.auth.hashers import make_password

# Create your models here.
