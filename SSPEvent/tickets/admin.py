from django.contrib import admin
from tickets.models import *
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
# Register your models here.

admin.site.register(Event)
admin.site.register(Permission)