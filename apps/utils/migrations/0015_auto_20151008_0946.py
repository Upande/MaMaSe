# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0014_feed_lastupdate'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feed',
            old_name='added',
            new_name='timestamp',
        ),
    ]
