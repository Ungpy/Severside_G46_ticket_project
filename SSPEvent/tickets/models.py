from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class LocationType(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()

class Locations(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    capacity = models.IntegerField(default=0)
    hour_price_rate = models.DecimalField(max_digits=12, decimal_places=2)
    location_type = models.ForeignKey(LocationType, on_delete=models.SET_NULL, null=True)

class Events(models.Model):
    Status_Choice = (
        ('PENDING', 'Pending'),
        ('APPROVED', 'Approve'),
        ('DENIED', 'Denied')
    )


    name = models.CharField(max_length=50)
    description = models.TextField()
    organizer = models.ForeignKey('auth.User', on_delete=models.SET_NULL, related_name='tickets_events_organizer', null=True)
    approver = models.ForeignKey('auth.User', on_delete=models.SET_NULL, related_name='tickets_events_approver', null=True)
    locations = models.ForeignKey(Locations, on_delete=models.SET_NULL, null=True)
    event_start = models.DateTimeField()
    event_end = models.DateTimeField()
    event_status = models.CharField(
        max_length=10,
        choices=Status_Choice
    )



class Tickets(models.Model):
    events = models.ForeignKey(Events, on_delete=models.CASCADE, null=False)
    name = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=12, decimal_places=2)



class Employee(models.Model):
    user = models.OneToOneField('auth.User', related_name='tickets_employee', on_delete=models.CASCADE) 
    salary = models.DecimalField(max_digits=12, decimal_places=2)
    contact = models.CharField(max_length=10)




class Payments(models.Model):
    member = models.ForeignKey('auth.User', related_name='tickets_payment_member', on_delete=models.CASCADE)
    ticket = models.ForeignKey(Tickets, on_delete=models.CASCADE)