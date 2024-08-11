from django.urls import path
from . import  views

urlpatterns = [
    path('',views.index,name='base index'),
    path('qna/',views.qna,name='qna')
]