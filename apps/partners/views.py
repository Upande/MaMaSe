from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

from .models import PartnerLogo
from .forms import PartnerLogoForm

def LogoUpload(request):
    # Handle file upload
    if request.method == 'POST':
        form = PartnerLogoForm(request.POST, request.FILES)
        if form.is_valid():
            newlogo = PartnerLogo(partner_logo = request.FILES['partner_logo'])
            newlogo.save()

            # Redirect to the document list after POST
            return HttpResponseRedirect(reverse('apps.partners.views.LogoUpload'))
    else:
        form = PartnerLogoForm() # A empty, unbound form

    # Load images for the list page
    logos = PartnerLogo.objects.all()
    print logos
    # Render list page with the documents and the form
    return render_to_response(
        'base.html',
        {'logos': logos, 'form': form},
        context_instance=RequestContext(request)
    )

    

def index(request):
    return render_to_response('partners/index.html')

