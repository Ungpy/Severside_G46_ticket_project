from django.shortcuts import render
from tickets.models import *
from django.views import View
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from tickets.forms import *
from django.urls import reverse
from django.db import transaction
from django.contrib.auth import authenticate, logout, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.forms import modelformset_factory


# Create your views here.


#class Index(view):
class Login(View):
    def get(self, request):
        form = AuthenticationForm()
        return render(request, 'login.html', {"form": form})
    
    def post(self, request):
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user() 
            login(request,user)
            return redirect('booking-list')  

        return render(request,'login.html', {"form":form})


class Logout(View):
    def get(self, request):
        logout(request)
        return redirect('login')

class EventsList(View):
    def get(self, request):
        # query event
        events = Event.objects.all()
       
        for event in events:
            if event.cover_image == "/media/images/image.png":
                event.cover_image = "/images/n.png"
            event.save()
        # search
        query = request.GET

        

        if query.get("search"):
            events = Event.objects.filter(
                name__icontains=query.get("search")
            )

        context = {
            "events" : events
        }
        
        return render(request, "event_list.html", context)

class EventDetails(View):
    def get(self, request, event_id):
        try:
            event = Event.objects.get(pk=event_id)
        except Event.DoesNotExist:
            return render(request, '404.html')
        
        tickets = Ticket.objects.filter(events_id=event.id) 
        
        context = {
            "event" : event,
            "tickets" : tickets
        }

        return render(request, "event_detail.html", context)

    def post(self, request):
        return True

class LocationList(View):
    def get(self, request):
        locations = Location.objects.all()

        context = {
            "locations" : locations
        }
        return render(request, "location_list.html", context)
    

class LocationDetail(View):
    def get(self, request, location_id):
        try:
            location = Location.objects.get(pk=location_id)
        except Location.DoesNotExist:
            return render(request, '404.html')
        
        
        context = {
            "location" : location,
        }

        return render(request, "location_detail.html", context)


class CreateEvent(LoginRequiredMixin, View):
    login_url = '/login/'
    def get(self, request):
        form = EventForm()
        tform = TicketForm()

        context = {
            'tform' : tform,
            'form' : form
        }
        return render(request, 'create_event.html', context)
    
    def post(self, request):
        # print(request.FILES, type(request.FILES))
        print(request.POST)
        
        form = EventForm(request.POST, request.FILES)
        if form.is_valid() and request.user.is_authenticated:
            event = form.save()
            event.organizer = request.user
            event.save()
            url = reverse('event-detail', args=[event.id])
            return redirect(url)
  
        return render(request, 'create_event.html', {'form': form })


class CreateLocation(LoginRequiredMixin, View):
    login_url = '/login/'
    def get(self, request):
        form = LocationForm()
        return render(request, 'create_location.html', {'form': form })
    
    def post(self, request):
        # print(request.FILES, type(request.FILES))
        print(request.POST)
        
        form = LocationForm(request.POST, request.FILES)
        if form.is_valid():
            location = form.save()
            url = reverse('location-detail', args=[location.id])
            return redirect(url)
  
        return render(request, 'create_location.html', {'form': form })


class CreateLocationType(LoginRequiredMixin, View):
    login_url = '/login/'
    def get(self, request):
        form = LocationTypeForm()
        return render(request, 'create_locationtype.html', {'form': form })
    
    def post(self, request):
        # print(request.FILES, type(request.FILES))
        print(request.POST)
        
        form = LocationTypeForm(request.POST)
        if form.is_valid():
            location = form.save()
            url = reverse('main-page')
            return redirect(url)
  
        return render(request, 'create_locationtype.html', {'form': form })


class ManageEventList(LoginRequiredMixin, View):
    login_url = '/login/'
    def get(self, request):
        # query event
        events = Event.objects.filter(event_status="PENDING")

        # search
        query = request.GET


        if query.get("search"):
            events = Event.objects.filter(
                name__icontains=query.get("search")
            )
        
        context = {
            "events" : events
        }

        return render(request, "manage-event.html", context)
        
    def post(self, request):
        event_id = request.POST['event_id']
        new_status = request.POST['status']

        event = Event.objects.get(pk=event_id)
        event.event_status = new_status
        event.save()

        url = reverse('event-detail', args=[event_id])
        return redirect(url)


class ManageLocation(LoginRequiredMixin, View):
    login_url = '/login/'
    def get(self, request, location_id):
        # query event
        location = Location.objects.get(pk=location_id)

        form = LocationForm(instance=location)

        context = {
            'form' : form
        }

        return render(request, "manage_location.html", context)
    def post(self, request, location_id):
        location = Location.objects.get(pk=location_id)
        form = LocationForm(instance=location, data=request.POST)
        if form.is_valid:
            new_location = form.save()
            print(new_location.capacity)
            url = reverse('location-detail', args=[location_id])
            return redirect(url)
        return render(request, "manage_location.html", {'form': form })

class DeleteLocation(View):
    def get(self, request, location_id):
        # query event
        location = Location.objects.get(pk=location_id)

        location.delete()

        return render(request, "location_list.html")


class UserProfile(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/login/'
    def get(self, request):
        return True

class Checkout(View):
    def get(self, request):
        return True
