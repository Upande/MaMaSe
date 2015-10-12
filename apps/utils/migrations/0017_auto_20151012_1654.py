# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0016_auto_20151009_0831'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feed',
            name='field1',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field2',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field3',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field4',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field5',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field6',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field7',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feed',
            name='field8',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
    ]
