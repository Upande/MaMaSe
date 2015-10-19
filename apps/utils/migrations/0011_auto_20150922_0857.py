# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0010_auto_20150917_0821'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='added',
            field=models.DateTimeField(),
        ),
    ]
