# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0004_auto_20150812_0719'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='partnerlogo',
            options={'verbose_name': 'Title'},
        ),
        migrations.AlterField(
            model_name='partnerlogo',
            name='title',
            field=models.CharField(max_length=255, verbose_name=b'Title', blank=True),
        ),
    ]
