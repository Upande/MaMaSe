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
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    elevation = models.TextField()
    last_entry_id = models.IntegerField()
    
    def __unicode__(self):
        return self.name

class ChannelField(models.Model):
    tag = models.TextField()
    field = models.TextField()
    added = models.DateTimeField(auto_now_add=True)
    channel = models.ForeignKey(Channel)

    def __unicode__(self):
        return self.field

class Feed(models.Model):
    channel = models.ForeignKey(Channel)
    entry_id = models.IntegerField(unique=True)
    created_at = models.DateTimeField()

    def __unicode__(self):
        return str(self.entry_id)

class FeedField(models.Model):
    reading = models.TextField(default="")
    channelField = models.ForeignKey(ChannelField)
    feed = models.ForeignKey(Feed)
    added = models.DateTimeField(auto_now_add=True)
