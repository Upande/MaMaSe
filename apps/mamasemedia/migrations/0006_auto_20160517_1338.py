# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-05-17 13:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mamasemedia', '0005_auto_20160517_1231'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mediapagerelatedlink',
            name='caption',
            field=models.TextField(blank=True, null=True),
        ),
    ]