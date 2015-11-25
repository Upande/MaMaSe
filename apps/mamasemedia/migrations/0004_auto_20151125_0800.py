# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('mamasemedia', '0003_mediapage_caption'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='mediapage',
            name='caption',
        ),
        migrations.AddField(
            model_name='mediapagerelatedlink',
            name='caption',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
    ]
