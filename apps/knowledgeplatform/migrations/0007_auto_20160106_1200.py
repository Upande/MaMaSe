# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('knowledgeplatform', '0006_auto_20160106_1115'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursepage',
            name='schedule',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Schedule', blank=True),
        ),
        migrations.AlterField(
            model_name='coursepage',
            name='books',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Books', blank=True),
        ),
    ]
