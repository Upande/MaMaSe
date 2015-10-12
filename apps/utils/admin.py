from django.contrib import admin

from .models import Channel,Feed,LoggerData,EmailRecipient,Email,AggregateMonthlyFeed,AggregateDailyFeed
# Register your models here.

class ChannelAdmin(admin.ModelAdmin):
    fields = ['name', 'description','latitude','longitude','elevation','created_at','data_id']
    list_display=['name','description','latitude','longitude','elevation','created_at','data_id']
    search_fields = ['name']

class FeedAdmin(admin.ModelAdmin):
    fields = ['entry_id', 'channel','field1','field2','field3','field4','field5','field6','field7','field8','timestamp']
    list_display = ['entry_id','channel','field1','field2','field3','field4','field5','field6','field7','field8','timestamp','lastupdate']
    search_fields = ['channel__name','entry_id']

class EmailRecipientAdmin(admin.ModelAdmin):
    fields = ['role', 'name','email']
    list_display=['role','name','email']

class EmailAdmin(admin.ModelAdmin):
    fields = ['sender', 'subject','email','message']
    list_display=['sender','subject','email']

class LoggerDataAdmin(admin.ModelAdmin):
    fields = ['raw_data']
    list_display = ['raw_data','added']

class AggregateMonthlyFeedAdmin(admin.ModelAdmin):
    fields = ['data','channel','aggregation','timestamp']
    list_display = ['data','lastupdate','channel','aggregation','timestamp']
    search_fields = ['channel__name','aggregation']

class AggregateDailyFeedAdmin(admin.ModelAdmin):
    fields = ['data','channel','aggregation','timestamp']
    list_display = ['data','lastupdate','channel','aggregation','timestamp']
    search_fields = ['channel__name','aggregation']

admin.site.register(Channel,ChannelAdmin)
admin.site.register(Feed,FeedAdmin)
admin.site.register(LoggerData,LoggerDataAdmin)
admin.site.register(EmailRecipient,EmailRecipientAdmin)
admin.site.register(Email,EmailAdmin)
admin.site.register(AggregateDailyFeed,AggregateDailyFeedAdmin)
admin.site.register(AggregateMonthlyFeed,AggregateMonthlyFeedAdmin)
