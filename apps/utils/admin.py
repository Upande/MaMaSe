from django.contrib import admin

from .models import Channel,Feed,LoggerData,EmailRecipient,Email,AggregateMonthlyFeed,AggregateDailyFeed,Field
# Register your models here.

class ChannelAdmin(admin.ModelAdmin):
    fields = ['name', 'description','latitude','longitude','elevation','created_at','data_id']
    list_display=['name','description','latitude','longitude','elevation','created_at','data_id']
    search_fields = ['name']

class FeedAdmin(admin.ModelAdmin):
    fields = ['entry_id', 'channel','timestamp','lastupdate']
    list_display = ['entry_id','channel','timestamp','lastupdate']
    search_fields = ['channel__name','entry_id']

class FieldAdmin(admin.ModelAdmin):
    fields = ['entry_id', 'name','added']
    list_display = ['name','added']
    search_fields = ['name']
    
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
admin.site.register(Field,FieldAdmin)
admin.site.register(AggregateDailyFeed,AggregateDailyFeedAdmin)
admin.site.register(AggregateMonthlyFeed,AggregateMonthlyFeedAdmin)
