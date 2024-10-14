from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class LocationType(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()

    def __str__(self):
        return self.name

class Location(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    capacity = models.IntegerField(default=0)
    hour_price_rate = models.DecimalField(max_digits=12, decimal_places=2)
    location_type = models.ForeignKey(LocationType, on_delete=models.SET_NULL, null=True)
    cover_image = models.ImageField(null=True, blank=True, upload_to='images/location/')
    
    def __str__(self):
        return self.name


class Event(models.Model):
    Status_Choice = (
        ('PENDING', 'Pending'),
        ('APPROVED', 'Approve'),
        ('DENIED', 'Denied')
    )


    name = models.CharField(max_length=50)
    description = models.TextField()
    organizer = models.ForeignKey('auth.User', on_delete=models.SET_NULL, related_name='tickets_events_organizer', null=True)
    approver = models.ForeignKey('auth.User', on_delete=models.SET_NULL, related_name='tickets_events_approver', null=True)
    locations = models.ForeignKey(Location, on_delete=models.SET_NULL, null=True)
    event_start = models.DateTimeField()
    event_end = models.DateTimeField()
    event_status = models.CharField(
        max_length=10,
        choices=Status_Choice,
        default='PENDING'
    )
    cover_image = models.ImageField(null=True, blank=True, upload_to='images/')


class Ticket(models.Model):
    events = models.ForeignKey(Event, on_delete=models.CASCADE, null=False)
    name = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=12, decimal_places=2)
    amount = models.IntegerField()



class Employee(models.Model):
    user = models.OneToOneField('auth.User', related_name='tickets_employee', on_delete=models.CASCADE) 
    salary = models.DecimalField(max_digits=12, decimal_places=2)
    contact = models.CharField(max_length=10)


class MemberInfo(models.Model):
    Gender_Choice = (
        ('M', 'Male'),
        ('F', 'Female'),
        ('OTHER', 'Other')
    )

    member = models.ForeignKey('auth.User', related_name='tickets_memberinfo_member', on_delete=models.CASCADE)
    gender = models.CharField(
        max_length=10,
        choices=Gender_Choice,
        default='OTHER'
    )
    address = models.CharField(max_length=150)
    contact = models.CharField(max_length=10)
    ticket = models.ManyToManyField(Ticket)
    
