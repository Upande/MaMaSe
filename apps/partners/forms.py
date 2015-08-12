from django import forms

class PartnerLogoForm(forms.Form):
    partner_logo = forms.ImageField(
        label='Select a file',
    )