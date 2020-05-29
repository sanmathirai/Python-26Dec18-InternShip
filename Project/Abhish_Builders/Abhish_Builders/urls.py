"""Abhish_Builders URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from operator import index

from django.conf.urls import url
from django.contrib import admin
from django.template.context_processors import static
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from Abhish_Builders import settings
from poll import views
from poll.views import login, contact, signup, indexpage, registeruser, admin_home, add_property, display_property, \
    view_property, userhome, aboutus, delete_property, contactus, edit_property_details, edit_properties, \
    all_properties, company_details, aboutcompany

urlpatterns = [
    path('admin/', admin.site.urls),
    #------------------index----------------
    url(r'^indexpage/', indexpage),
url(r'^login/', login),
url(r'^contact/', contact),
url(r'^signup/', signup),
url(r'^registeruser/', registeruser),

    #---------------user--------------------

url(r'^userhome/', userhome),
url(r'^all_properties/', all_properties),
url(r'^contactus/', contactus),
url(r'^aboutus/', aboutus),
url(r'^(?P<pk>\d+)/$', view_property, name='view_property'),

    #---------------admin-----------------

url(r'^admin_home/', admin_home),
url(r'^company_details/', company_details),
url(r'^aboutcompany/', aboutcompany),
url(r'^add_property/', add_property),
url(r'^display_property/', display_property),
url(r'^edit_properties/', edit_properties),
    url(r'^edit_property_details/(?P<pk>\d+)/$', edit_property_details, name='edit_property_details'),


url(r'^delete_property/(?P<pk>\d+)/$', delete_property,name='delete_property'),


]
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
