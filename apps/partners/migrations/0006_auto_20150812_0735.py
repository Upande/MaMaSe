# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0005_auto_20150812_0730'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='partnerlogo',
            options={},
        ),
        migrations.AlterField(
            model_name='partnerlogo',
            name='title',
            field=models.CharField(max_length=255, blank=True),
        ),
    ]
