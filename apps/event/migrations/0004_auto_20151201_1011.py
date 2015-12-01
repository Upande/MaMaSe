# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import datetime
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtaildocs', '0003_add_verbose_names'),
        ('event', '0003_merge'),
    ]

    operations = [
        migrations.RenameField(
            model_name='eventpage',
            old_name='body',
            new_name='abstract',
        ),
        migrations.RemoveField(
            model_name='eventpage',
            name='cost',
        ),
        migrations.RemoveField(
            model_name='eventpage',
            name='end_date',
        ),
        migrations.RemoveField(
            model_name='eventpage',
            name='location',
        ),
        migrations.RemoveField(
            model_name='eventpage',
            name='maps_url',
        ),
        migrations.RemoveField(
            model_name='eventpage',
            name='start_date',
        ),
        migrations.AddField(
            model_name='eventpage',
            name='date',
            field=models.DateField(default=datetime.datetime.now, verbose_name=b'Post date'),
        ),
        migrations.AddField(
            model_name='eventpage',
            name='document',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtaildocs.Document', null=True),
        ),
        migrations.AddField(
            model_name='eventpage',
            name='report',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
        migrations.AddField(
            model_name='eventpage',
            name='venue',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
    ]
