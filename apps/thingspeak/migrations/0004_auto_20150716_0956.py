# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('thingspeak', '0003_auto_20150716_0854'),
    ]

    operations = [
        migrations.CreateModel(
            name='Feed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('entry_id', models.IntegerField(unique=True)),
                ('created_at', models.DateTimeField()),
                ('field1', models.TextField(default=b'')),
                ('field2', models.TextField(default=b'')),
                ('field3', models.TextField(default=b'')),
                ('field4', models.TextField(default=b'')),
                ('field5', models.TextField(default=b'')),
                ('field6', models.TextField(default=b'')),
                ('field7', models.TextField(default=b'')),
                ('field8', models.TextField(default=b'')),
                ('field9', models.TextField(default=b'')),
                ('field10', models.TextField(default=b'')),
                ('channel', models.ForeignKey(to='thingspeak.Channel')),
            ],
        ),
        migrations.RemoveField(
            model_name='feeds',
            name='channel',
        ),
        migrations.DeleteModel(
            name='Feeds',
        ),
    ]
