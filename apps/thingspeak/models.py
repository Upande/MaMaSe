from django.db import models
from jsonfield import JSONField
# Create your models here.

class LoggerData(models.Model):
    raw_data = JSONField()
    added = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)
