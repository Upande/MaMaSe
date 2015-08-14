# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    replaces = [(b'galleryapp', '0001_initial'), (b'galleryapp', '0003_auto_20150813_1210'), (b'galleryapp', '0004_auto_20150813_1249'), (b'galleryapp', '0005_auto_20150813_1306'), (b'galleryapp', '0006_remove_image_image'), (b'galleryapp', '0007_image_image')]

    dependencies = [
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, to='wagtailcore.Page')),
                ('gallery_slug', models.SlugField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.TextField(blank=True)),
            ],
            options={
                'ordering': ['name'],
                'verbose_name_plural': 'galleries',
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, to='wagtailcore.Page')),
                ('image_slug', models.SlugField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.TextField(blank=True)),
                ('date', models.DateField(blank=True)),
                ('gallery', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, to='galleryapp.Gallery', null=True)),
                ('image', models.ImageField(default=datetime.datetime(2015, 8, 13, 13, 19, 9, 932332, tzinfo=utc), upload_to=b'MaMaSeGalleries')),
            ],
            options={
                'ordering': ['name'],
            },
            bases=('wagtailcore.page',),
        ),
    ]
