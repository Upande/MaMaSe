# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0011_auto_20150922_0857'),
    ]

    operations = [
        migrations.CreateModel(
            name='AggregateDailyFeed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data', jsonfield.fields.JSONField(null=True, blank=True)),
                ('lastupdate', models.DateTimeField(auto_now_add=True)),
                ('timestamp', models.DateTimeField()),
                ('channel', models.ForeignKey(related_name='daily_channels', to='utils.Channel')),
            ],
        ),
        migrations.CreateModel(
            name='AggregateMonthlyFeed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data', jsonfield.fields.JSONField(null=True, blank=True)),
                ('lastupdate', models.DateTimeField(auto_now_add=True)),
                ('timestamp', models.DateTimeField()),
                ('channel', models.ForeignKey(related_name='monthly_channels', to='utils.Channel')),
            ],
        ),
    ]
