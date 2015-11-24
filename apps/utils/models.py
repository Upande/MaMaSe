from django.db import models
from jsonfield import JSONField
import datetime
# Create your models here.

class LoggerData(models.Model):
    raw_data = JSONField()
    added = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

class Channel(models.Model):
    data_id = models.IntegerField(unique=True)
    name = models.TextField()
    description = models.TextField()
    latitude  = models.FloatField()
    longitude  = models.FloatField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField(auto_now_add=True)
    elevation = models.TextField()
    last_entry_id = models.IntegerField(default=0)
    username = models.TextField()
    
    def __unicode__(self):
        return self.name

class Field(models.Model):
    name = models.TextField(unique=True)
    added = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.name

class ChannelField(models.Model):
    channel = models.ForeignKey(Channel, related_name="channels")
    field = models.ForeignKey(Field, related_name="field")
    name = models.TextField()
    added = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.channel.name + " ("+ self.field.name + ")"
    
class Feed(models.Model):
    channelfield = models.ForeignKey(ChannelField, related_name="channels",blank=True,null=True)
    entry_id = models.IntegerField()
    timestamp = models.DateTimeField()
    lastupdate = models.DateTimeField(auto_now_add =True)
    reading = models.FloatField(default = 0.0,blank=True,null=True)
    
    def __unicode__(self):
        return str(self.entry_id)


class EmailRecipient(models.Model):
    role = models.CharField(max_length = 200)
    name = models.CharField(max_length = 200)
    email = models.CharField(max_length = 200)
    active = models.BooleanField(default = True)

    def __unicode__(self):
        return self.name + " (" + self.email + ")"

class Email(models.Model):
    sender = models.CharField(max_length = 200)
    email = models.CharField(max_length = 200)
    subject = models.CharField(max_length = 255)
    message = models.TextField()
    sent = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return self.sender + " (" + self.email + ")"

class AggregateDailyFeed(models.Model):
    
    AGGREGATE_TYPES = (
        ('COUNT', 'Count'),
        ('SUM', 'Sum'),
        ('MIN', 'Min'),
        ('MAX', 'Max'),
        ('AVG', 'Avg'),
    )

    data = JSONField(blank=True,null=True)
    lastupdate = models.DateTimeField(auto_now_add =True)
    timestamp = models.DateTimeField()#This has to be midday on the specific day
    channel = models.ForeignKey(Channel, related_name="daily_channels")
    channelfield = models.ForeignKey(ChannelField, related_name="daily_channelfields",blank=True,null=True)
    aggregation = models.CharField(max_length=15,choices=AGGREGATE_TYPES,default="Count")
    
class AggregateMonthlyFeed(models.Model):
    AGGREGATE_TYPES = (
        ('COUNT', 'Count'),
        ('SUM', 'Sum'),
        ('MIN', 'Min'),
        ('MAX', 'Max'),
        ('AVG', 'Avg'),
    )

    data = JSONField(blank=True,null=True)
    lastupdate = models.DateTimeField(auto_now_add =True)
    timestamp = models.DateTimeField()#This has to be midmonth
    channel = models.ForeignKey(Channel, related_name="monthly_channels")
    channelfield = models.ForeignKey(ChannelField, related_name="monthly_channelfields",blank=True,null=True)
    aggregation = models.CharField(max_length=15,choices=AGGREGATE_TYPES,default="Count")
