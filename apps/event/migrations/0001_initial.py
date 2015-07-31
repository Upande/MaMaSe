# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import modelcluster.fields
import wagtail.wagtailcore.fields
import modelcluster.contrib.taggit


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0001_initial'),
        ('news', '0002_auto_20150730_0952'),
        ('wagtailimages', '0006_add_verbose_names'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.CreateModel(
            name='EventIndexPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('intro', wagtail.wagtailcore.fields.RichTextField(blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='EventIndexRelatedLink',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sort_order', models.IntegerField(null=True, editable=False, blank=True)),
                ('link_external', models.URLField(verbose_name=b'External link', blank=True)),
                ('title', models.CharField(help_text=b'Link title', max_length=255)),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='EventPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('start_date', models.DateTimeField(verbose_name=b'Start date')),
                ('end_date', models.DateTimeField(verbose_name=b'End date')),
                ('body', wagtail.wagtailcore.fields.RichTextField(blank=True)),
                ('location', wagtail.wagtailcore.fields.RichTextField(max_length=200)),
                ('maps_url', models.URLField(verbose_name=b'Map Link', blank=True)),
                ('cost', models.IntegerField(default=0)),
                ('category', models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='news.CategoryPage', null=True)),
                ('main_image', models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='EventPageTag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content_object', modelcluster.fields.ParentalKey(related_name='tagged_items', to='event.EventPage')),
                ('tag', models.ForeignKey(related_name='event_eventpagetag_items', to='taggit.Tag')),
            ],
            options={
                'abstract': False,
            },
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
