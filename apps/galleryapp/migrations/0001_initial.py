# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('name', models.CharField(max_length=55)),
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
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('name', models.CharField(max_length=50)),
                ('image', models.ImageField(null=True, upload_to=b'MaMaSeGalleries', blank=True)),
                ('description', models.TextField(blank=True)),
                ('gallery', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, to='galleryapp.Gallery', null=True)),
            ],
            options={
                'ordering': ['name'],
            },
            bases=('wagtailcore.page',),
        ),
    ]
