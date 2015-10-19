# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0001_squashed_0016_auto_20151009_0831'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='lastupdate',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
