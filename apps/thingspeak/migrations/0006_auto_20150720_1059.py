# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('thingspeak', '0005_auto_20150717_1258'),
    ]

    operations = [
        migrations.AddField(
            model_name='channelfield',
            name='tag',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='channelfield',
            name='field',
            field=models.TextField(),
        ),
    ]
