# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20150728_1304'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogpage',
            name='intro',
            field=wagtail.wagtailcore.fields.RichTextField(max_length=200),
        ),
    ]
