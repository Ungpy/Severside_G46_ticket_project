from django.shortcuts import render
from tickets.models import *
from django.views import View
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
# Create your views here.


#class Index(view):


class EventsList(View):
    def get(self, request):
        # query event
        events = Events.objects.all()

        # search
        query = request.GET

        context = {
            "events" : events
        }

        if query.get("search"):
            events = Events.objects.filter(
                name__icontains=query.get("search")
            )
        
        return render(request, "event_list.html", context)

class EventDetails(View):
    def get(self, request, event_id):
        try:
            event = Events.objects.get(pk=event_id)
        except Events.DoesNotExist:
            return render(request, '404.html')
        
        tickets = Tickets.objects.filter(events_id=event.id) 
        
        context = {
            "event" : event,
            "tickets" : tickets
        }

        return render(request, "event_detail.html", context)

    def post(self, request):
        return True

class LocationList(View):
    def get(self, request):
        locations = Locations.objects.all()

        context = {
            "locations" : locations
        }
        return render(request, "location_list.html", context)
    

class LocationDetail(View):
    def get(self, request, location_id):
        try:
            location = Locations.objects.get(pk=location_id)
        except Locations.DoesNotExist:
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