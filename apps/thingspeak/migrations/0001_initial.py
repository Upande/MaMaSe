# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Channel',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data_id', models.IntegerField(unique=True)),
                ('name', models.TextField()),
                ('description', models.TextField()),
                ('latitide', models.FloatField()),
                ('longitude', models.FloatField()),
                ('created_at', models.DateTimeField()),
                ('updated_at', models.DateTimeField()),
                ('elevation', models.TextField()),
                ('last_entry_id', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='ChannelField',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tag', models.TextField()),
                ('field', models.TextField()),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('channel', models.ForeignKey(to='thingspeak.Channel')),
            ],
        ),
        migrations.CreateModel(
            name='Feed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('entry_id', models.IntegerField(unique=True)),
                ('created_at', models.DateTimeField()),
                ('channel', models.ForeignKey(to='thingspeak.Channel')),
            ],
        ),
        migrations.CreateModel(
            name='FeedField',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('reading', models.TextField(default=b'')),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('channelField', models.ForeignKey(to='thingspeak.ChannelField')),
                ('feed', models.ForeignKey(to='thingspeak.Feed')),
            ],
        ),
        migrations.CreateModel(
            name='LoggerData',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('raw_data', jsonfield.fields.JSONField()),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('active', models.BooleanField(default=True)),
            ],
        ),
    ]
