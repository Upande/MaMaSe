# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_auto_20150729_1145'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blogindexpage',
            name='description',
        ),
        migrations.RemoveField(
            model_name='blogpage',
            name='description',
        ),
    ]
