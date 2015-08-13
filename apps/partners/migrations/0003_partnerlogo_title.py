# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0002_auto_20150811_0843'),
    ]

    operations = [
        migrations.AddField(
            model_name='partnerlogo',
            name='title',
            field=models.CharField(default=datetime.datetime(2015, 8, 12, 7, 12, 32, 786544, tzinfo=utc), max_length=70),
            preserve_default=False,
        ),
    ]
