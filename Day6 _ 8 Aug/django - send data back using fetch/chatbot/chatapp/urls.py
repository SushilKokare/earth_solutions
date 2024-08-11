from django.urls import path
from . import  views

urlpatterns = [
    path('',views.index,name='base index'),
    path('qna/',views.qna,name='qna'),
    path('qnadata/',views.qnadata,name='qnadata'),
    path('storedata/',views.storedata,name='storedata')
]