from django import forms
from tickets.models import *
from django.forms import ModelForm, SplitDateTimeField, DateTimeField
from django.forms.widgets import SplitDateTimeWidget, DateTimeInput
from datetime import datetime, timezone
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

    def clean(self):
        cleaned_data = super().clean()
        event_start = cleaned_data.get("event_start")
        event_end = cleaned_data.get("event_end")

        if event_start > event_end:
            self.add_error(
            "event_start",
            "Start time cannot be future than End time"
        )

        events_samelocation = Event.objects.filter(locations=cleaned_data.get("locations"))
        events_starttime_overlap = events_samelocation.filter(event_end__gt=event_start, event_start__lt=event_start).exclude(event_status__exact="DENIED").first()
        events_endtime_overlap = events_samelocation.filter(event_end__gt=event_end, event_start__lt=event_end).exclude(event_status__exact="DENIED").first()
        
        if events_starttime_overlap:
            self.add_error(
            "event_start",
            "Event start time overlaped with other event in same location ["+ events_starttime_overlap.name + "] start : " + events_starttime_overlap.event_start.strftime('%Y-%m-%d %H:%M') + " | end : " + events_starttime_overlap.event_end.strftime('%Y-%m-%d %H:%M' + " You can see event schedule in 'Location detail'")
        )
        if events_endtime_overlap:
            self.add_error(
            "event_end",
            "Event end time overlaped with other event in same location ["+ events_endtime_overlap.name + "] start : " + events_endtime_overlap.event_start.strftime('%Y-%m-%d %H:%M') + " | end : " + events_endtime_overlap.event_end.strftime('%Y-%m-%d %H:%M' + " You can see event schedule in 'Location detail'")
        )
        now_aware = datetime.now(timezone.utc)
        if event_start < now_aware:
            self.add_error(
            "event_start",
            "Event start time can not be in the pass"
        )
        if event_end < now_aware:
            self.add_error(
            "event_end",
            "Event end time can not be in the pass"
        )
        return cleaned_data
        


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
    amount = forms.IntegerField(min_value=0)
    class Meta:
        model = Ticket
        fields = [
            "name",
            "price",
            "amount",
        ]
    def __init__(self, *args, **kwargs):
        super(TicketForm, self).__init__(*args, **kwargs) 
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

