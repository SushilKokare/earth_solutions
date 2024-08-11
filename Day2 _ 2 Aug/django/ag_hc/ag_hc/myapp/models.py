from django.db import models

# Create your models here.

class ag_table(models.Model):
    make = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    price = models.FloatField()
    electric = models.BooleanField()



