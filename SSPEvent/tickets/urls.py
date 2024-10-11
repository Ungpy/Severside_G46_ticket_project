from django.urls import path

from tickets import views

urlpatterns = [
    path("", views.EventsList.as_view(), name="main-page"),
    path("event-list/", views.EventsList.as_view(), name="event-list"),
    path("event-list/<int:event_id>/", views.EventDetails.as_view(), name="event-detail"),
]

