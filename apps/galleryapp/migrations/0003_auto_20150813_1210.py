# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import filer.fields.image
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0002_auto_20150813_1210'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ForeignKey(related_name='galleryapp_image', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True),
            #field=filer.fields.image.FilerImageField(on_delete=django.db.models.deletion.SET_NULL, to='filer.Image', null=True),
        ),
    ]
