# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0007_auto_20150916_0802'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feed',
            name='created_at',
        ),
    ]
