# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0015_auto_20151008_0946'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='entry_id',
            field=models.IntegerField(),
        ),
    ]
