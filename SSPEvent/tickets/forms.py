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
            "event_start": forms.DateTimeInput(attrs={"type": "datetime-local", "class" : "form-control col-md-4"}),
            "event_end": forms.DateTimeInput(attrs={"type": "datetime-local", "class" : "form-control col-md-4"})
        }
    def __init__(self, *args, **kwargs):
        super(EventForm, self).__init__(*args, **kwargs) 
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})


class LocationForm(ModelForm):
    capacity = forms.IntegerField(min_value=1)
    
    class Meta:
        model = Location
        fields = [
            "name",
            "description",
            "capacity",
            "hour_price_rate",
            "location_type",
            "cover_image",
        ]
        
        widgets = {
            "hour_price_rate": forms.NumberInput(attrs={"min": 0, "step" : "100", "class" : "form-control col-md-4"}),
        }
    def __init__(self, *args, **kwargs):
        super(LocationForm, self).__init__(*args, **kwargs) 
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

class LocationTypeForm(ModelForm):
    class Meta:
        model = LocationType
        fields = [
            "name",
            "description",
        ]
    def __init__(self, *args, **kwargs):
        super(LocationTypeForm, self).__init__(*args, **kwargs) 
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

class TicketForm(ModelForm):
    price = forms.IntegerField(min_value=0)
    class Meta:
        model = Ticket
        fields = [
            "name",
            "price",
        ]
    def __init__(self, *args, **kwargs):
        super(TicketForm, self).__init__(*args, **kwargs) 
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

