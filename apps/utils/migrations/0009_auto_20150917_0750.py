# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0008_remove_feed_created_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='channel',
            field=models.ForeignKey(related_name='feeds', to='utils.Channel'),
        ),
    ]
