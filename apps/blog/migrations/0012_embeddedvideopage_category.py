# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0011_embeddedvideoindexpage_embeddedvideoindexrelatedlink'),
    ]

    operations = [
        migrations.AddField(
            model_name='embeddedvideopage',
            name='category',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='blog.CategoryPage', null=True),
        ),
    ]
