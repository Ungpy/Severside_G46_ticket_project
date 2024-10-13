from django.shortcuts import render
from django.views import View
from django.shortcuts import render, redirect
from django.contrib.auth import logout, login
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User
from authen.forms import *
from django.contrib.auth.models import Group


# Create your views here.
class Login(View):
    def get(self, request):
        form = AuthenticationForm()
        return render(request, 'login.html', {"form": form})
    
    def post(self, request):
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user() 
            login(request,user)
            return redirect('main-page')  

        return render(request,'login.html', {"form":form})


class Logout(View):
    def get(self, request):
        logout(request)
        return redirect('login')
    
class Register(View):
    def get(self, request):
        form = MyUserCreateForm()
        form_info = MemberInfoForm()
        return render(request, 'register.html', {"form": form, "form_info":form_info})
    
    def post(self, request):
        form = MyUserCreateForm(data=request.POST)
        form_info = MemberInfoForm(data=request.POST)
        if form.is_valid() and form_info.is_valid():
            # print("eee")
            user = form.save()
            form_info.instance.member = user
            form_info.save()
            member_group = Group.objects.get(name='Member_normal') 
            member_group.user_set.add(user)
            return redirect('login')  

        return render(request, 'register.html', {"form": form, "form_info":form_info})
