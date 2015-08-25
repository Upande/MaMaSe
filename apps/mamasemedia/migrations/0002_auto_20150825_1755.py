# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('mamasemedia', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mediapagerelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='media_items', to='mamasemedia.MediaPage'),
        ),
    ]
