# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import filer.fields.image


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=filer.fields.image.FilerImageField(to='filer.Image'),
        ),
    ]
