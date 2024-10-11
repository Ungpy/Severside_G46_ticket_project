from django.shortcuts import render
from tickets.models import *
from django.views import View
from django.shortcuts import render, redirect
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

        # if query.get("search"):
        #     events = Events.filter(
        #         name__icontains=query.get("search")
        #     )
        
        return render(request, "event-list", context)

class EventDetails(View):
    def get(self, request, event_id):
        return render(request, "event_detail.html")

    def post(self, request):
        return True


