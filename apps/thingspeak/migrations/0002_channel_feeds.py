# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('thingspeak', '0001_initial'),
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
                ('field1', models.TextField()),
                ('field2', models.TextField()),
                ('field3', models.TextField()),
                ('created_at', models.DateTimeField()),
                ('updated_at', models.DateTimeField()),
                ('elevation', models.TextField()),
                ('last_entry_id', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Feeds',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('entry_id', models.IntegerField(unique=True)),
                ('created_at', models.DateTimeField()),
                ('field1', models.TextField(default=b'')),
                ('field2', models.TextField(default=b'')),
                ('field3', models.TextField(default=b'')),
                ('field4', models.TextField(default=b'')),
                ('field5', models.TextField(default=b'')),
                ('channel', models.ForeignKey(to='thingspeak.Channel')),
            ],
        ),
    ]
