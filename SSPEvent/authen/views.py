from django.shortcuts import render
from django.views import View
from django.shortcuts import render, redirect
from django.contrib.auth import logout, login
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User


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
        form = UserCreationForm()
        return render(request, 'register.html', {"form": form})
    
    def post(self, request):
        form = UserCreationForm(data=request.POST)
        if form.is_valid():
            print("eee")
            form.save()
            return redirect('login')  

        return render(request,'register.html', {"form":form})
