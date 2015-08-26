# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('partners', '0004_remove_partnerpage_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='partnerlogo',
            name='url',
            field=models.URLField(default=''),
            preserve_default=False,
        ),
    ]
