from django.db import models
from jsonfield import JSONField
# Create your models here.

class LoggerData(models.Model):
    raw_data = JSONField()
    added = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

class Channel(models.Model):
    data_id = models.IntegerField(unique=True)
    name = models.TextField()
    description = models.TextField()
    latitide  = models.FloatField()
    longitude  = models.FloatField()
    field1 = models.TextField(default="")
    field2 = models.TextField(default="")
    field3 = models.TextField(default="")
    field4 = models.TextField(default="")
    field5 = models.TextField(default="")
    field6 = models.TextField(default="")
    field7 = models.TextField(default="")
    field8 = models.TextField(default="")
    field9 = models.TextField(default="")
    field10 = models.TextField(default="")
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    elevation = models.TextField()
    last_entry_id = models.IntegerField()
    
    def __unicode__(self):
        return self.name

class Feed(models.Model):
    channel = models.ForeignKey(Channel)
    entry_id = models.IntegerField(unique=True)
    created_at = models.DateTimeField()
    field1 = models.TextField(default="")
    field2 = models.TextField(default="")
    field3 = models.TextField(default="")
    field4 = models.TextField(default="")
    field5 = models.TextField(default="")
    field6 = models.TextField(default="")
    field7 = models.TextField(default="")
    field8 = models.TextField(default="")
    field9 = models.TextField(default="")
    field10 = models.TextField(default="")

    def __unicode__(self):
        return str(self.entry_id)
