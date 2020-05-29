from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from Abhish_Builders.image_form.image import imagefor, imageform_1
from poll.models import register, property_details, about_builders

#---------------------------------------------INDEX----------------------------------------------------------------
imageform = imagefor()
imageform1 = imageform_1()
def login(request):
    if request.method=='POST':
        email= request.POST["email"]
        password=request.POST["password"]

        result = register.objects.all()

        for user in result:
            if email == user.emailid and password == user.password :
                if email=="admin@gmail.com" and password=="admin":
                    return render(request, 'admin/admin_home.html',{'imag': imageform})
                else:
                    property_detail = property_details.objects.all()
                    return render(request, 'user/userhome.html', {'prop_details': property_detail})
        for user in result:
            if email != user.emailid and password != user.password:
                return render(request, 'index.html')


def indexpage(request):
    return render(request, 'index.html')

def contact(request):
    return render(request, 'contact.html')


def signup(request):
    return render(request, 'signup.html')


def registeruser(request):
    if request.method=='POST':
        name= request.POST["name"]
        email=request.POST["emailid"]
        password = request.POST["password"]
        number=request.POST["contact"]
        registration=register(name=name,emailid=email,password=password,contact=number)
        registration.save()
        return render(request,'signup.html',{'success': 'Submited Succesfully'})

#-------------------------------ADMIN--------------------------------------------------------------------
def admin_home(request):
    return render(request, 'admin/admin_home.html', {'imag': imageform})



def add_property(request):
    saved=False
    if request.method=='POST' :
        myimage=imagefor(request.POST,request.FILES)
        if myimage.is_valid():
            if request.method == 'POST':
                property_name= request.POST["property_name"]
                address=request.POST["address"]
                property_det = request.POST["property_details"]
                about_location=request.POST["about_location"]
                facilities=request.POST["facilities"]
                add_property=property_details(property_name=property_name,adress=address,property_details=property_det,
                                              about_location=about_location,facilities=facilities,property_image=request.FILES['photo'])
                add_property.save()
                saved=True
    if saved==True:
        return render(request, 'admin/admin_home.html', {'succes': 'Submited Succesfully','imag': imageform,})
    else:
        return render(request, 'admin/display_properties.html')



def display_property(request):
    property_detail= property_details.objects.all()
    return render(request, 'admin/display_properties.html', {'property_detail': property_detail})

def edit_property_details(request,pk):
    property_detail = property_details.objects.get(pk=pk)
    return render(request, 'admin/Edit_property_details.html',
                  {'property_detail': property_detail, 'imag': imagefor})

def edit_properties(request):
    saved = False
    if request.method == 'POST':
        myimage = imagefor(request.POST, request.FILES)
        if myimage.is_valid():
            if request.method == 'POST':
                key=request.POST["primary_key"]
                property_name = request.POST["property_name"]
                address = request.POST["address"]
                property_det = request.POST["property_details"]
                about_location = request.POST["about_location"]
                facilities = request.POST["facilities"]

                property_details.objects.filter(pk=key).update(property_name=property_name, adress=address, property_details=property_det,
                                 about_location=about_location, facilities=facilities)
                saved=True
    if saved == True:
        p_details = property_details.objects.all()
        return render(request, 'admin/display_properties.html', {'property_detail': p_details})
    else:
        return render(request, 'index.html')


def delete_property(request,pk):
    property_details.objects.get(pk=pk).delete()
    property_detail = property_details.objects.all()
    return render(request, 'admin/display_properties.html', {'property_detail': property_detail})

def company_details(request):
    return render(request, 'admin/about_comany.html')

def aboutcompany(request):
    if request.method == 'POST':
        emailid = request.POST["email_id"]
        website = request.POST["website"]
        timing = request.POST["timing"]
        abt_company=about_builders(email_id=emailid,website=website,timing=timing)
        abt_company.save()

        return render(request, 'admin/about_comany.html', {'success': 'Submited Succesfully'})


#---------------------------------------------------USER----------------------------------------------------

def view_property(request,pk):
    propert = property_details.objects.get(pk=pk)
    return render(request, 'user/viewproperty.html',{'vi':propert})

def all_properties(request):
    property_detail = property_details.objects.all()
    return render(request, 'user/All_projects.html',{'prop_details':property_detail})

def userhome(request):
    property_detail = property_details.objects.all()
    return render(request, 'user/userhome.html',{'prop_details':property_detail})
def aboutus(request):
    return render(request,'user/aboutus.html')
def contactus(request):
    return  render(request,"user/contact.html")
