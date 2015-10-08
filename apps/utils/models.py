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
    
    #For speed, I shall make this table not fully normalized. We shall have fields 1-9. Not very scalable but easily queried
    field1 = models.TextField(default="",null=True,blank=True)
    field2 = models.TextField(default="",null=True,blank=True)
    field3 = models.TextField(default="",null=True,blank=True)
    field4 = models.TextField(default="",null=True,blank=True)
    field5 = models.TextField(default="",null=True,blank=True)
    field6 = models.TextField(default="",null=True,blank=True)
    field7 = models.TextField(default="",null=True,blank=True)
    field8 = models.TextField(default="",null=True,blank=True)
    
    def __unicode__(self):
        return self.name

class Feed(models.Model):
    channel = models.ForeignKey(Channel, related_name="channels")
    entry_id = models.IntegerField(unique=True)
    timestamp = models.DateTimeField()
    lastupdate = models.DateTimeField(auto_now_add =True)

    #For speed, I shall make this table not fully normalized. We shall have fields 1-9. Not very scalable but easily queried
    field1 = models.FloatField(default=0.0,null=True,blank=True)
    field2 = models.FloatField(default=0.0,null=True,blank=True)
    field3 = models.FloatField(default=0.0,null=True,blank=True)
    field4 = models.FloatField(default=0.0,null=True,blank=True)
    field5 = models.FloatField(default=0.0,null=True,blank=True)
    field6 = models.FloatField(default=0.0,null=True,blank=True)
    field7 = models.FloatField(default=0.0,null=True,blank=True)
    field8 = models.FloatField(default=0.0,null=True,blank=True)

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
    aggregation = models.CharField(max_length=15,choices=AGGREGATE_TYPES,default="Count")
