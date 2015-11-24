# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0003_auto_20151110_0956'),
    ]

    operations = [
        migrations.AddField(
            model_name='feed',
            name='field',
            field=models.ForeignKey(related_name='fields', blank=True, to='utils.Field', null=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='reading',
            field=models.FloatField(default=0.0, null=True, blank=True),
        ),
    ]
