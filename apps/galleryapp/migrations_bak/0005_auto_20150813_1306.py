# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0004_auto_20150813_1249'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(default=datetime.datetime(2015, 8, 13, 13, 6, 16, 684079, tzinfo=utc), upload_to=b'MaMaSeGalleries'),
            preserve_default=False,
        ),
    ]
