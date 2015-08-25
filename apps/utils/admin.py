from django.contrib import admin

from .models import Channel,Feed,LoggerData,EmailRecipient
# Register your models here.

class ChannelAdmin(admin.ModelAdmin):
    fields = ['name', 'description','latitude','longitude','elevation','created_at','updated_at']

class FeedAdmin(admin.ModelAdmin):
    fields = ['entry_id', 'channel','created_at','field1']

class EmailAdmin(admin.ModelAdmin):
    fields = ['role', 'name','email']

class LoggerDataAdmin(admin.ModelAdmin):
    fields = ['raw_data']
    list_display = ['raw_data','added']

admin.site.register(Channel,ChannelAdmin)
admin.site.register(Feed,FeedAdmin)
admin.site.register(LoggerData,LoggerDataAdmin)
admin.site.register(EmailRecipient,EmailAdmin)
