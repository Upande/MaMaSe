# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-09-29 13:19
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0013_make_rendition_upload_callable'),
        ('video', '0002_auto_20150817_0948'),
    ]

    operations = [
        migrations.AddField(
            model_name='embeddedvideopage',
            name='video_image',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtailimages.Image'),
        ),
    ]