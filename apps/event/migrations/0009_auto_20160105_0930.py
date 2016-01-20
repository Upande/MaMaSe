# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0008_auto_20151202_0712'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventpage',
            name='venue',
            field=models.TextField(blank=True),
        ),
    ]
