# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0005_auto_20150821_0747'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='partnerpage',
            name='date',
        ),
        migrations.AddField(
            model_name='partnerlogo',
            name='url',
            field=models.URLField(default=''),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='partnerpage',
            name='website',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]
