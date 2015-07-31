# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailredirects', '0002_add_verbose_names'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('wagtailsearch', '0002_add_verbose_names'),
        ('wagtailforms', '0002_add_verbose_names'),
        ('news', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='embeddedvideoindexpage',
            name='page_ptr',
        ),
        migrations.RemoveField(
            model_name='embeddedvideoindexrelatedlink',
            name='link_page',
        ),
        migrations.RemoveField(
            model_name='embeddedvideoindexrelatedlink',
            name='page',
        ),
        migrations.RemoveField(
            model_name='embeddedvideopage',
            name='category',
        ),
        migrations.RemoveField(
            model_name='embeddedvideopage',
            name='page_ptr',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image1',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image2',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image3',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image4',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image5',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='image6',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='page_ptr',
        ),
        migrations.DeleteModel(
            name='EmbeddedVideoIndexPage',
        ),
        migrations.DeleteModel(
            name='EmbeddedVideoIndexRelatedLink',
        ),
        migrations.DeleteModel(
            name='EmbeddedVideoPage',
        ),
        migrations.DeleteModel(
            name='Gallery',
        ),
    ]
