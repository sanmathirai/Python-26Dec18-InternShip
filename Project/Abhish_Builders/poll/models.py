from django.db import models
from PIL import Image

# Create your models here.
class register(models.Model):
    name= models.CharField(max_length=25)
    emailid = models.CharField(max_length=25)
    password= models.TextField(default='null')
    contact = models.CharField(max_length=25)

class property_details(models.Model):
    property_name = models.CharField(max_length=100)
    adress = models.CharField(max_length=30)
    property_details = models.CharField(max_length=1350)
    about_location = models.CharField(max_length=1350)
    facilities=models.CharField(max_length=1350)
    property_image=models.ImageField(upload_to='property_image',blank=True)
    def __str__(self):
        return self.name

class about_builders(models.Model):
    email_id = models.CharField(max_length=25,blank=True)
    website = models.CharField(max_length=25)
    timing= models.CharField(max_length=25)
