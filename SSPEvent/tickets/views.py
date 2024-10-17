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
from authen.forms import *
from django.http import HttpResponseForbidden, Http404, HttpResponseNotFound, HttpResponseBadRequest
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from datetime import *

# Create your views here.


#class Index(view):
class MainPage(View):
    def get(self, request):
        events_endsoon = Event.objects.filter(event_start__lt=datetime.now(),event_end__gt=datetime.now(), event_status__exact="APPROVED")
        events_endsoon = events_endsoon.order_by("event_end")[:4]

        events_startsoon = Event.objects.filter(event_start__gt=datetime.now(), event_status__exact="APPROVED")
        events_startsoon = events_startsoon.order_by("event_start")[:4]

        locations = Location.objects.all()

        context = {
            "locations" : locations,
            "events_startsoon" : events_startsoon,
            "events_endsoon" : events_endsoon,
        }
        return render(request, "index.html", context)
        

class EventsList(View):
    def get(self, request):
        # query event
        events = Event.objects.filter(event_end__gt=datetime.now(), event_status__exact="APPROVED")

        
        # search
        query = request.GET

        

        if query.get("search"):
            events = Event.objects.filter(
                name__icontains=query.get("search"),
                event_start__gt=datetime.now(), 
                event_status__exact="APPROVED",
            )

        context = {
            "events" : events,
            "search_enable" : True,
        }
        
        return render(request, "event_list.html", context)

class EventDetails(View):
    def get(self, request, event_id):
        try:
            event = Event.objects.get(pk=event_id)
        except Event.DoesNotExist:
            return render(request, '404.html')
        duration = event.event_end-event.event_start
        rent_price = int(( duration.total_seconds() / 3600 ) * float(event.locations.hour_price_rate))
        tickets = Ticket.objects.filter(events_id=event.id) 
        form = TicketForm()
        context = {
            "event" : event,
            "tickets" : tickets,
            'form' : form,
            'rent_price' : rent_price
        }

        return render(request, "event_detail.html", context)

    def post(self, request, event_id):
        print(event_id)
        event = Event.objects.get(pk=event_id)
        create_by_user_id = event.organizer.id
        if create_by_user_id != request.user.id:
            return HttpResponseForbidden()
        form = TicketForm(request.POST)
        context = {
            'form' : form
        }
        if form.is_valid():
            Ticket.objects.create(
                events = event, 
                name= form.cleaned_data['name'], 
                price =  form.cleaned_data['price'],
                amount =  form.cleaned_data['amount']
                )
        url = reverse('event-detail', args=[event_id])
        return redirect(url)

class LocationList(View):
    def get(self, request):
        locations = Location.objects.all()
        
        query = request.GET
        if query.get("search"):
            locations = Location.objects.filter(
                name__icontains=query.get("search")
            )
        context = {
            "locations" : locations,
            "search_enable" : True,
        }
        return render(request, "location_list.html", context)
    

class LocationDetail(View):
    def get(self, request, location_id):
        try:
            location = Location.objects.get(pk=location_id)
        except Location.DoesNotExist:
            # return render(request, '404.html')
            raise Http404
        

        
        events = Event.objects.filter(locations=location, event_end__gt=datetime.now()).order_by("event_end")
        context = {
            "location" : location,
            'events': events
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
                        Ticket.objects.create(events = new_event, name=form1.cleaned_data['name'], price = form1.cleaned_data['price'],  amount = form1.cleaned_data['amount'])
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
            "events" : events,
            "search_enable" : True,
        }

        return render(request, "manage-event.html", context)
        
    def post(self, request):
        event_id = request.POST['event_id']
        new_status = request.POST['status']

        event = Event.objects.get(pk=event_id)
        event.event_status = new_status
        event.approver = request.user
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
            'form' : form,
        }

        return render(request, "manage_location.html", context)
    def post(self, request, location_id):
        try:
            location = Location.objects.get(pk=location_id)
        except Location.DoesNotExist:
            raise Http404()
        form = LocationForm(request.POST, request.FILES, instance=location,)
        if form.is_valid():
            new_location = form.save()
            print(new_location.capacity)
            url = reverse('location-detail', args=[location_id])
            return redirect(url)
        return render(request, "manage_location.html", {'form': form })

class DeleteLocation(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.delete_location"]
    def get(self, request, location_id):
        # query event
        location = Location.objects.get(pk=location_id)

        location.delete()
    
        return redirect("location-list")


class UserProfile(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["auth.view_user", "auth.change_user"]

    def get(self, request, username):
        user = User.objects.get(username=username)
        memberinfo = MemberInfo.objects.get(member= user)
        event = Event.objects.filter(organizer=user)
        payment = Ticket.objects.filter(memberinfo=memberinfo)
        context = {
            'user' : user,
            'events' : event,
            'payments' : payment,
        }
        return render(request, 'user_profile.html', context)


class Checkout(LoginRequiredMixin, PermissionRequiredMixin ,View):
    login_url = '/authen/login/'
    permission_required = ["tickets.view_ticket"]

    def post(self, request):
        ticket_id = request.POST['ticket_id']
        print(ticket_id)
        event_id = request.POST['event_id']
        ticket = Ticket.objects.get(pk=ticket_id)
        event = Event.objects.get(pk=event_id)
        if event.event_status == "APPROVED":
            print(request.POST)

            context = {
                'ticket' : ticket,
                'event' : event
            }
            return render(request, 'checkout.html', context)
        return HttpResponseForbidden()
        


class CreatePayments(LoginRequiredMixin,PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["tickets.view_ticket"]

    def post(self, request):
        ticket_id = request.POST['ticket_id']
        ticket = Ticket.objects.get(pk=ticket_id)
        print(ticket.name)
        try:
            memberinfo = MemberInfo.objects.get(member__id=request.user.id)
        except MemberInfo.DoesNotExist:
            raise Http404("MemberInfo not found for this user id " + str(request.user.id))

        check_memberticket = Ticket.objects.filter(memberinfo=memberinfo.id, id=ticket_id)
        print(memberinfo)

        if ticket is not None and not check_memberticket:
            memberinfo.ticket.add(ticket)
            ticket.amount -= 1
            ticket.save()

            url = reverse('user-profile', args=[request.user.username])
            return redirect(url)
        # return HttpResponseBadRequest("")
        context = {
            "errortext" : "You can't buy same ticket tier more than once"
        }
        return render(request, '404.html', context)

class EditProfile(LoginRequiredMixin, View):
    login_url = '/authen/login/'

    def get(self, request, username):
        user = User.objects.get(username=username)
        if user.id != request.user.id:
            return HttpResponseForbidden()
            
        memberinfo = MemberInfo.objects.get(member__id=user.id)
        userform = UpdateUserForm(instance=user)
        infoform = MemberInfoForm(instance=memberinfo)
        passwordform = PasswordChangeForm(user=user)

        context = {
            'userform' : userform,
            'infoform' : infoform,
            'passwordform' : passwordform,
        }
        return render(request, 'edit_profile.html', context)
    def post(self, request, username):
        user = User.objects.get(username=username)
        if user.id != request.user.id:
            return HttpResponseForbidden()
        memberinfo = MemberInfo.objects.get(member__id=user.id)
        userform = UpdateUserForm(request.POST, instance=user)
        infoform = MemberInfoForm(request.POST, instance=memberinfo)
        print(userform.is_valid(), user, request.POST)
        if userform.is_valid() and infoform.is_valid():
            userform.save()
            infoform.save()

            url = reverse('user-profile', args=[username])
            return redirect(url)

        context = {
            'userform' : userform,
            'infoform' : infoform,
            'passwordform' : PasswordChangeForm(user=user),
        }
        # url = reverse('edit-profile', args=[username],  )
        # return redirect(url)
        return render(request, 'edit_profile.html', context)
        
class ChangePassword(LoginRequiredMixin, PermissionRequiredMixin, View):
    login_url = '/authen/login/'
    permission_required = ["auth.view_user", "auth.change_user"]
    def post(self, request, username):
        user = User.objects.get(username=username)
        userreq = request.user
        if user.id != request.user.id:
            return HttpResponseForbidden()
            
        form = PasswordChangeForm(request.user ,request.POST)
        if form.is_valid():
            form.save()
            url = reverse('user-profile', args=[username])
            return redirect(url)
        url = reverse('edit-profile', args=[username])
        return redirect(url)
                
