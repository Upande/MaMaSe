# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import modelcluster.contrib.taggit
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0001_initial'),
        ('taggit', '0001_initial'),
        ('wagtailimages', '0006_add_verbose_names'),
        ('event', '0001_initial'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.AddField(
            model_name='eventpage',
            name='category',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='news.CategoryPage', null=True),
        ),
        migrations.AddField(
            model_name='eventpage',
            name='main_image',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True),
        ),
        migrations.AddField(
            model_name='eventpage',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(to='taggit.Tag', through='event.EventPageTag', blank=True, help_text='A comma-separated list of tags.', verbose_name='Tags'),
        ),
        migrations.AddField(
            model_name='eventindexrelatedlink',
            name='link_page',
            field=models.ForeignKey(related_name='+', blank=True, to='wagtailcore.Page', null=True),
        ),
        migrations.AddField(
            model_name='eventindexrelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='related_links', to='event.EventIndexPage'),
        ),
    ]
