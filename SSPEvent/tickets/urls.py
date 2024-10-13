from django.urls import path

from tickets import views

urlpatterns = [
    path("", views.MainPage.as_view(), name="main-page"),
    path("event-list/", views.EventsList.as_view(), name="event-list"),
    path("event-list/<int:event_id>/", views.EventDetails.as_view(), name="event-detail"),
    path("location-list/", views.LocationList.as_view(), name="location-list"),
    path("location-list/<int:location_id>/", views.LocationDetail.as_view(), name="location-detail"),
    path("profile/", views.UserProfile.as_view(), name="userprofile"),
    path("checkout/", views.Checkout.as_view(), name="checkout"),
    path("create-event/", views.CreateEvent.as_view(), name="create-event"),
    path("create-location/", views.CreateLocation.as_view(), name="create-location"),
    path("create-locationtype/", views.CreateLocationType.as_view(), name="create-locationtype"),
    path("manage-event/", views.ManageEventList.as_view(), name="manage-event"),
    path("manage-location/<int:location_id>", views.ManageLocation.as_view(), name="manage-location"),
    path("delete-location/<int:location_id>", views.DeleteLocation.as_view(), name="delete-location"),
    path("profile/<str:username>", views.UserProfile.as_view(), name="user-profile"),
]

