# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_auto_20150729_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogindexpage',
            name='description',
            field=wagtail.wagtailcore.fields.RichTextField(max_length=200, blank=True),
        ),
        migrations.AddField(
            model_name='blogpage',
            name='description',
            field=wagtail.wagtailcore.fields.RichTextField(max_length=200, blank=True),
        ),
    ]
