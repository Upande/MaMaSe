# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_auto_20150729_1445'),
    ]

    operations = [
        migrations.AddField(
            model_name='embeddedvideopage',
            name='description',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
    ]
