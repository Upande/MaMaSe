# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0004_remove_partnerpage_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='partnerpage',
            name='website',
        ),
        migrations.AddField(
            model_name='partnerpage',
            name='date',
            field=models.DateField(default=datetime.datetime(2015, 8, 21, 7, 47, 1, 141281), verbose_name=b'Entry date'),
            preserve_default=False,
        ),
    ]
