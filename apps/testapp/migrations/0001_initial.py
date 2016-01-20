# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import wagtail.wagtailcore.blocks
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.CreateModel(
            name='TPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('author', models.CharField(max_length=255)),
                ('date_created', models.DateField(auto_now_add=True)),
                ('date_modified', models.DateField(auto_now=True)),
                ('body', wagtail.wagtailcore.fields.StreamField([(b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(icon=b'image')), (b'image_carousel', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'image', wagtail.wagtailimages.blocks.ImageChooserBlock()), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False))]), template=b'testapp/t_page.html', icon=b'image'))])),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
    ]
