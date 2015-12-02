# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import modelcluster.fields
import datetime
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0006_add_verbose_names'),
        ('wagtaildocs', '0003_add_verbose_names'),
        ('event', '0007_auto_20151201_1253'),
    ]

    operations = [
        migrations.CreateModel(
            name='DocumentPageRelatedLink',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sort_order', models.IntegerField(null=True, editable=False, blank=True)),
                ('embedded_link', models.URLField(verbose_name=b'Embedded link', blank=True)),
                ('title', models.CharField(help_text=b'Link title', max_length=255)),
                ('note', wagtail.wagtailcore.fields.RichTextField(blank=True)),
                ('document', models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtaildocs.Document', null=True)),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='MediaPageRelatedLink',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sort_order', models.IntegerField(null=True, editable=False, blank=True)),
                ('embedded_link', models.URLField(verbose_name=b'Embedded link', blank=True)),
                ('title', models.CharField(help_text=b'Link title', max_length=255)),
                ('caption', wagtail.wagtailcore.fields.RichTextField(blank=True)),
                ('image', models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True)),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.AlterField(
            model_name='eventpage',
            name='date',
            field=models.DateField(default=datetime.datetime.now, verbose_name=b'Event date'),
        ),
        migrations.AddField(
            model_name='mediapagerelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='media_items', to='event.EventPage'),
        ),
        migrations.AddField(
            model_name='documentpagerelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='document_items', to='event.EventPage'),
        ),
    ]
