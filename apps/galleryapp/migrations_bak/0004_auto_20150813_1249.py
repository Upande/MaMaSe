# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0003_auto_20150813_1210'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ForeignKey(related_name='galleryapp_image', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True),
        ),
    ]
