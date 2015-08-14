# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0002_auto_20150813_1210'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gallery',
            name='gallery_slug',
        ),
        migrations.RemoveField(
            model_name='image',
            name='image_slug',
        ),
        migrations.AlterField(
            model_name='gallery',
            name='page_ptr',
            field=models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page'),
        ),
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(upload_to=b'MaMaSeGalleries',blank=True,null=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='image',
            name='page_ptr',
            field=models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page'),
        ),
    ]
