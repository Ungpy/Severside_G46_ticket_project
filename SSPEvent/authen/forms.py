from django import forms
from tickets.models import *
from django.forms import ModelForm, SplitDateTimeField, DateTimeField
from django.forms.widgets import SplitDateTimeWidget, DateTimeInput
from django.contrib.auth.forms import UserCreationForm
class MyUserCreateForm(UserCreationForm):

    class Meta:
        model = User
        fields = [  
            "username",
            "first_name",
            "last_name",
            "email", 
            ]


