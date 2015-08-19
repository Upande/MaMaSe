# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import modelcluster.fields
import django.db.models.deletion
from django.conf import settings
import modelcluster.contrib.taggit


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('wagtailimages', '0006_add_verbose_names'),
        ('news', '0001_initial'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('event', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='attendee',
            name='event',
            field=models.ForeignKey(default='', to='event.EventPage'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='attendee',
            name='user',
            field=models.ForeignKey(default='', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='eventindexrelatedlink',
            name='link_page',
            field=models.ForeignKey(related_name='+', blank=True, to='wagtailcore.Page', null=True),
        ),
        migrations.AddField(
            model_name='eventindexrelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='related_links', default='', to='event.EventIndexPage'),
            preserve_default=False,
        ),
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
    ]
