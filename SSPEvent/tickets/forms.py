from django import forms
from tickets.models import *
from django.forms import ModelForm, SplitDateTimeField, DateTimeField

from django.forms.widgets import SplitDateTimeWidget, DateTimeInput
class EventForm(ModelForm):
    class Meta:
        model = Event

        fields = [  
            "name",
            "description",
            "locations",
            "event_start", 
            "event_end",
            "cover_image",
            ]
        # widgets = {
        #     "event_start": forms.SplitDateTimeWidget(date_attrs={"class": "input", "type": "date"},
        #         time_attrs={"class": "input", "type": "time"}),
        #     "event_end": forms.SplitDateTimeWidget(date_attrs={"class": "input", "type": "date"},
        #         time_attrs={"class": "input", "type": "time"})
        # }
        widgets = {
            "event_start": forms.DateTimeInput(attrs={"type": "datetime-local"}),
            "event_end": forms.DateTimeInput(attrs={"type": "datetime-local"})
        }

    def clean(self):
        
        return super().clean()

class LocationForm(ModelForm):
    class Meta:
        model = Location
        fields = [
            "name",
            "description",
            "capacity",
            "hour_price_rate",
            "location_type",
        ]

class LocationTypeForm(ModelForm):
    class Meta:
        model = LocationType
        fields = [
            "name",
            "description",
        ]

class TicketForm(ModelForm):
    class Meta:
        model = Ticket
        fields = [
            "events",
            "name",
            "price",
        ]