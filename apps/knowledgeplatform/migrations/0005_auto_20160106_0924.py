# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import wagtail.wagtaildocs.blocks
import wagtail.wagtailimages.blocks
import django.db.models.deletion
import wagtail.wagtailcore.blocks
import wagtail.wagtailembeds.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('wagtailredirects', '0002_add_verbose_names'),
        ('wagtailimages', '0006_add_verbose_names'),
        ('wagtailsearch', '0002_add_verbose_names'),
        ('wagtailforms', '0002_add_verbose_names'),
        ('knowledgeplatform', '0004_auto_20160105_0930'),
    ]

    operations = [
        migrations.CreateModel(
            name='CoursePage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('author', models.CharField(max_length=255)),
                ('date', models.DateField(verbose_name=b'Post date')),
                ('body', wagtail.wagtailcore.fields.StreamField([(b'paragraph', wagtail.wagtailcore.blocks.RichTextBlock()), (b'urls', wagtail.wagtailcore.blocks.URLBlock()), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock()), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock()), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock())])),
                ('course_image', models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.RenameModel(
            old_name='KnowledgeIndexPage',
            new_name='CourseIndexPage',
        ),
        migrations.RemoveField(
            model_name='knowledgepage',
            name='course_image',
        ),
        migrations.RemoveField(
            model_name='knowledgepage',
            name='page_ptr',
        ),
        migrations.DeleteModel(
            name='KnowledgePage',
        ),
    ]
