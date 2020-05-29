from django import forms
class imagefor(forms.Form):
    photo=forms.ImageField(label="Add Prperty Image",required=False)

class imageform_1(forms.Form):
    Photo1=forms.ImageField(label="Cahnge image",required=False)