# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('testapp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tpage',
            name='date',
        ),
        migrations.AddField(
            model_name='tpage',
            name='date_created',
            field=models.DateField(default=datetime.datetime(2015, 8, 14, 8, 53, 6, 282597, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='tpage',
            name='date_modified',
            field=models.DateField(default=datetime.datetime(2015, 8, 14, 8, 53, 25, 627811, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
