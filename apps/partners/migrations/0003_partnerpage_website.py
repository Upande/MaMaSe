# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0002_partnerindexpage_partnerpage'),
    ]

    operations = [
        migrations.AddField(
            model_name='partnerpage',
            name='website',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]
