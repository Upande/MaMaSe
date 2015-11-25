# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('mamasemedia', '0002_auto_20150825_1755'),
    ]

    operations = [
        migrations.AddField(
            model_name='mediapage',
            name='caption',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
    ]
