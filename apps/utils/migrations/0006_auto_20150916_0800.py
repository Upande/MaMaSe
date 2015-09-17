# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0005_auto_20150914_0655'),
    ]

    operations = [
        migrations.RenameField(
            model_name='channel',
            old_name='latitide',
            new_name='latitude',
        ),
    ]
