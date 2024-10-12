from django.urls import path

from tickets import views

urlpatterns = [
    path("", views.EventsList.as_view(), name="main-page"),
    path("event-list/", views.EventsList.as_view(), name="event-list"),
    path("event-list/<int:event_id>/", views.EventDetails.as_view(), name="event-detail"),
    path("location-list/", views.LocationList.as_view(), name="location-list"),
    path("location-list/<int:location_id>/", views.LocationDetail.as_view(), name="location-detail"),
    path("profile/", views.UserProfile.as_view(), name="userprofile"),
    path("checkout/", views.Checkout.as_view(), name="checkout"),
]

