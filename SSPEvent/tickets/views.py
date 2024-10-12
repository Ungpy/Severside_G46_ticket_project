from django.shortcuts import render
from tickets.models import *
from django.views import View
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from tickets.forms import *
from django.urls import reverse
# Create your views here.


#class Index(view):


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

        context = {
            "events" : events
        }

        if query.get("search"):
            events = Event.objects.filter(
                name__icontains=query.get("search")
            )
        
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


class UserProfile(View):
    def get(self, request):
        return True

class Checkout(View):
    def get(self, request):
        return True

class CreateLocation(View):
    def get(self, request):
        return True

class CreateEvent(View):
    def get(self, request):
        form = EventForm()
        return render(request, 'create_event.html', {'form': form })
    
    def post(self, request):
        # print(request.FILES, type(request.FILES))
        print(request.POST)
        
        form = EventForm(request.POST, request.FILES)
        if form.is_valid():
            event = form.save()
            url = reverse('event-detail', args=[event.id])
            return redirect(url)
  
        return render(request, 'create_event.html', {'form': form })