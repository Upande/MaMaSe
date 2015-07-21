# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('thingspeak', '0004_auto_20150716_0956'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChannelField',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('field', models.TextField(default=b'')),
                ('added', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='FeedField',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('reading', models.TextField(default=b'')),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('channelField', models.ForeignKey(to='thingspeak.ChannelField')),
            ],
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field1',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field10',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field2',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field3',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field4',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field5',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field6',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field7',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field8',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field9',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field1',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field10',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field2',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field3',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field4',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field5',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field6',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field7',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field8',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field9',
        ),
        migrations.AddField(
            model_name='feedfield',
            name='feed',
            field=models.ForeignKey(to='thingspeak.Feed'),
        ),
        migrations.AddField(
            model_name='channelfield',
            name='channel',
            field=models.ForeignKey(to='thingspeak.Channel'),
        ),
    ]
