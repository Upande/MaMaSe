# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0003_email'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='channelfield',
            name='channel',
        ),
        migrations.RemoveField(
            model_name='feedfield',
            name='channelField',
        ),
        migrations.RemoveField(
            model_name='feedfield',
            name='feed',
        ),
        migrations.AddField(
            model_name='channel',
            name='field1',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field2',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field3',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field4',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field5',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field6',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field7',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field8',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field9',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='added',
            field=models.DateTimeField(default=datetime.datetime(2015, 9, 10, 9, 15, 33, 694293, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='feed',
            name='field1',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field2',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field3',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field4',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field5',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field6',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field7',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field8',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feed',
            name='field9',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
        migrations.DeleteModel(
            name='ChannelField',
        ),
        migrations.DeleteModel(
            name='FeedField',
        ),
    ]
