from django.contrib import admin
from apps.partners.models import PartnerLogo
# Register your models here.

class PartnerLogoAdmin(admin.ModelAdmin):
	list_display = ('title', 'url')

admin.site.register(PartnerLogo, PartnerLogoAdmin)

