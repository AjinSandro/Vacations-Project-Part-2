from django.db.models import Model, CharField, DecimalField, IntegerField, DateField, AutoField, FileField,EmailField
from django.db.models import ForeignKey
from django.db import models
from django.core.validators import MinLengthValidator , MaxLengthValidator, MinValueValidator,MaxValueValidator
from django.forms import EmailInput, ModelForm, PasswordInput, TextInput,ModelForm, TextInput,Select,NumberInput,DateInput
from django.contrib.auth.models import AbstractUser,AbstractBaseUser
from django.contrib.auth.hashers import make_password
from django.contrib.admin.models import LogEntry
from api.managers import UserManager


class RefreshTokenModel(Model):
    token = CharField(max_length=1024)
    user = ForeignKey("Users", db_column='user_id', on_delete=models.DO_NOTHING)
    class Meta:
        db_table = "refresh_tokens"

class Role(Model):

    Id = IntegerField(primary_key=True,auto_created=True)
    role_type = CharField(max_length=20)
    class Meta:
        db_table = 'roles'  # Specify the existing table name
        managed = False

class Users(AbstractBaseUser):
    userId = models.BigAutoField(primary_key=True)  # Custom user ID
    firstname = CharField(max_length=20, validators=(MinLengthValidator(2),MaxLengthValidator(20)))
    lastname = CharField(max_length=20, validators=(MinLengthValidator(2),MaxLengthValidator(20)))
    email = EmailField(max_length=30,unique=True, validators=(MinLengthValidator(5),MaxLengthValidator(30)))
    password = CharField(max_length=128, validators=(MinLengthValidator(2),MaxLengthValidator(128)))
    role_type = ForeignKey("Role",db_column='role_type', on_delete=models.DO_NOTHING)

    USERNAME_FIELD = "email"

    objects =  UserManager() 
    class Meta:
        db_table = 'app_users'  # Specify the existing table name
        managed = False

    def get_by_natural_key(self, email):
        return self.get(email=email)
