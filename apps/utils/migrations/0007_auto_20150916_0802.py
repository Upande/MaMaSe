# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0006_auto_20150916_0800'),
    ]

    operations = [
        migrations.AlterField(
            model_name='channel',
            name='updated_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
