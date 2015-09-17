# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0009_auto_20150917_0750'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='channel',
            field=models.ForeignKey(related_name='channels', to='utils.Channel'),
        ),
    ]
