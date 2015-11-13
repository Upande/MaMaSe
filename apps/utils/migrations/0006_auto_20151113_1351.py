# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0005_auto_20151110_1313'),
    ]

    operations = [
        migrations.AddField(
            model_name='aggregatedailyfeed',
            name='channelfield',
            field=models.ForeignKey(related_name='daily_channelfields', blank=True, to='utils.ChannelField', null=True),
        ),
        migrations.AddField(
            model_name='aggregatemonthlyfeed',
            name='channelfield',
            field=models.ForeignKey(related_name='monthly_channelfields', blank=True, to='utils.ChannelField', null=True),
        ),
    ]
