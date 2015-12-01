# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0005_auto_20151201_1053'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Attendee',
        ),
    ]
