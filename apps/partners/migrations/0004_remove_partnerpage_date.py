# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0003_partnerpage_website'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='partnerpage',
            name='date',
        ),
    ]
