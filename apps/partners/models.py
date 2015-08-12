from django.db import models

# Create your models here.
class PartnerLogo(models.Model):
	title = models.CharField(max_length=255, blank=True, null=True)
	partner_logo = models.ImageField(upload_to='partners')

	def __str__(self):
		return self.title