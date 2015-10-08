# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0013_auto_20151006_1147'),
    ]

    operations = [
        migrations.AddField(
            model_name='feed',
            name='lastupdate',
            field=models.DateTimeField(default=datetime.datetime(2015, 10, 8, 7, 39, 8, 775215, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
    ]
