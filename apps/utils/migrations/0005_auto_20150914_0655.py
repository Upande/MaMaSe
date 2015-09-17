# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0004_auto_20150910_0915'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='channel',
            name='field9',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field9',
        ),
        migrations.AddField(
            model_name='channel',
            name='username',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='channel',
            name='last_entry_id',
            field=models.IntegerField(default=0),
        ),
    ]
