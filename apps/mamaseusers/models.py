from django.db import models
from django.contrib.auth.models import User

class MamaseUser(models.Model):
    ''' We shall extend the default django user models to include additional parameters esp for events. 
    However, we could create more models for different users dealing with CMS e.g Admins, moderators etc'''
    
    user = models.OneToOneField(User)
    mobile_number = models.CharField(max_length=200) #Mobile number shall be used to contact users
    
