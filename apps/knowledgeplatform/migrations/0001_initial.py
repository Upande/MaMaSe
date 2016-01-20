# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtaildocs.blocks
import wagtail.wagtailimages.blocks
import wagtail.wagtailcore.fields
import wagtail.wagtailcore.blocks
import wagtail.wagtailembeds.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
    ]

    operations = [
        migrations.CreateModel(
            name='KnowledgePage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('author', models.CharField(max_length=255)),
                ('date', models.DateField(verbose_name=b'Post date')),
                ('body', wagtail.wagtailcore.fields.StreamField([(b'heading', wagtail.wagtailcore.blocks.CharBlock(classname=b'full title')), (b'paragraph', wagtail.wagtailcore.blocks.RichTextBlock()), (b'urls', wagtail.wagtailcore.blocks.URLBlock()), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock()), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock()), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock())])),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
    ]
