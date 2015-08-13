# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0006_remove_image_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='image',
            field=models.ImageField(default=datetime.datetime(2015, 8, 13, 13, 19, 9, 932332, tzinfo=utc), upload_to=b'MaMaSeGalleries'),
            preserve_default=False,
        ),
    ]
