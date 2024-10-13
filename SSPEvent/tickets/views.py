from django.shortcuts import render
from tickets.models import *
from django.views import View
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from tickets.forms import *
from django.urls import reverse
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.forms import formset_factory
from datetime import datetime


# Create your views here.


#class Index(view):
class MainPage(View):
    def get(self, request):
        events_endsoon = Event.objects.filter(event_end__gt=datetime.now())
        events_endsoon = events_endsoon.order_by("event_end")[:4]

        events_startsoon = Event.objects.filter(event_start__lt=datetime.now())
        events_startsoon = events_startsoon.order_by("event_start")[:4]

        locations = Location.objects.all()

        context = {
            "locations" : locations,
            "events_startsoon" : events_startsoon,
            "events_endsoon" : events_endsoon
        }
        return render(request, "index.html", context)
        

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
        form = TicketForm()
        context = {
            "event" : event,
            "tickets" : tickets,
            'form' : form
        }

        return render(request, "event_detail.html", context)

    def post(self, request, event_id):
        print(event_id)
        event = Event.objects.get(pk=event_id)
        form = TicketForm(request.POST)
        context = {
            'form' : form
        }
        if form.is_valid():
            Ticket.objects.create(
                events = event, 
                name= form.cleaned_data['name'], 
                price =  form.cleaned_data['price'])
        url = reverse('event-detail', args=[event_id])
        return redirect(url)

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


class CreateEvent(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.add_event"]

    def get(self, request):
        MTicketForm = formset_factory(form= TicketForm, extra=1)
        form = EventForm()
        tform = MTicketForm()
        
        context = {
            'tform' : tform,
            'form' : form
        }
        
        return render(request, 'create_event.html', context)
    
    def post(self, request):
        # print(request.FILES, type(request.FILES))
        # print(request.POST)
        MTicketForm = formset_factory(form= TicketForm, extra=1)
        form = EventForm(request.POST, request.FILES)
        tform =  MTicketForm(request.POST)
        # print(request.POST)
        context = {
            'tform' : tform,
            'form' : form
        }
        if form.is_valid() and request.user.is_authenticated:
            event = form.save()
            event.organizer = request.user
            event_id = event.id
            event.save()
            new_event = Event.objects.get(pk=event_id)
            if tform.is_valid():
                for form1 in tform:
                    if form1.cleaned_data['name']:
                        Ticket.objects.create(events = new_event, name=form1.cleaned_data['name'], price = form1.cleaned_data['price'])
                url = reverse('event-detail', args=[event.id])

                return redirect(url)
        # for form1 in tform:


        return render(request, 'create_event.html', context)


class CreateLocation(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.add_location"]

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


class CreateLocationType(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.add_locationtype"]

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


class ManageEventList(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.manage_event"]

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


class ManageLocation(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.change_location"]

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
    login_url = '/authen/login/'
    permission_required = ["delete_location"]
    def get(self, request, location_id):
        # query event
        location = Location.objects.get(pk=location_id)

        location.delete()

        return render(request, "location_list.html")


class UserProfile(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.change_user", "tickets.view_user"]

    def get(self, request):
        return True

class Checkout(View):
    def get(self, request):
        return True
