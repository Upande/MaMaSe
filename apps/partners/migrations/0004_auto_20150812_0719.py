# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0003_partnerlogo_title'),
    ]

    operations = [
        migrations.AlterField(
            model_name='partnerlogo',
            name='title',
            field=models.CharField(max_length=255, blank=True),
        ),
    ]
