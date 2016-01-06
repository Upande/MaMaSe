# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtaildocs', '0003_add_verbose_names'),
        ('knowledgeplatform', '0007_auto_20160106_1200'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='coursepage',
            name='documents',
        ),
        migrations.AddField(
            model_name='coursepage',
            name='document',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtaildocs.Document', null=True),
        ),
    ]
