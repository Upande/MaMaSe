# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gallery', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='gallery',
            name='image1_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='image2_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='image3_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='image4_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='image5_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='image6_caption',
            field=models.CharField(max_length=255, blank=True),
        ),
    ]
