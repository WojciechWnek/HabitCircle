from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import HabitViewSet, HabitLogViewSet

router = DefaultRouter()
router.register(r'habits', HabitViewSet, basename='habit')
router.register(r'habit_log', HabitLogViewSet, basename='habit_log')

urlpatterns = [
    path('', include(router.urls)),
]
