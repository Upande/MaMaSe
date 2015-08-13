# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0005_auto_20150813_1306'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='image',
        ),
    ]
