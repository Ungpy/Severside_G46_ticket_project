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
    
    def clean(self):
        data = super().clean()
        if data.get('first_name').isalpha():
            pass
        else:
            self.add_error(
            "first_name",
            "please enter only alphabet name")

        if data.get('last_name').isalpha():
            pass
        else:
            self.add_error(
            "last_name",
            "please enter only alphabet name")
        return data

            
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
    

    def clean(self):
        data = super().clean()
        if data.get("contact").isdigit() and len(data.get("contact")) >=9 and len(data.get("contact")) <= 10 and data.get("contact")[0] == "0":
            pass
        else:
            self.add_error(
            "contact",
            "please enter validate phone number (0xxxxxxxxx)")
        
        
        # if data.get('first_name').isalpha() and data.get('last_name').isalpha():
        #     return data
        # else:
        #     self.add_error(
        #     "first_name",
        #     "please enter only alphabet")
        return data


class UpdateUserForm(ModelForm):

    class Meta:
        model = User
        fields = [
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
    
        
