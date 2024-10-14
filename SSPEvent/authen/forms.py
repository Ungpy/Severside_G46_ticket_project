from django import forms
from tickets.models import *
from django.forms import ModelForm, SplitDateTimeField, DateTimeField
from django.forms.widgets import SplitDateTimeWidget, DateTimeInput
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
class MyUserCreateForm(UserCreationForm):

    class Meta:
        model = User
        fields = [
            "username",
            "first_name",
            "last_name",
            "email",
            ]
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name in self.fields:
            self.fields[field_name].help_text = None
            self.fields[field_name].widget.attrs['class'] = 'form-control mb-3'
            

            
class MemberInfoForm(ModelForm):

    class Meta:
        model = MemberInfo
        fields = [
            "gender",
            "address",
            "contact",
            ]
        widgets = {
            "address": forms.Textarea()
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name in self.fields:
            self.fields[field_name].widget.attrs['class'] = 'form-control mb-3'

class UpdateUserForm(ModelForm):

    class Meta:
        model = User
        fields = [
            "username",
            "first_name",
            "last_name",
            "email",
            ]
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name in self.fields:
            self.fields[field_name].help_text = None
            self.fields[field_name].widget.attrs['class'] = 'form-control mb-3'

class MyChangedpasswordForm(forms.Form):
    password1 = forms.CharField(max_length=100)
    newpassword1 = forms.CharField(max_length=100)
    newpassword2 = forms.CharField(max_length=100)
    
        
