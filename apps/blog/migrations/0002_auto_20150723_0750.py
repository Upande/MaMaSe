# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailredirects', '0002_add_verbose_names'),
        ('wagtailforms', '0002_add_verbose_names'),
        ('wagtailsearch', '0002_add_verbose_names'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blogpage',
            name='main_image',
        ),
        migrations.RemoveField(
            model_name='blogpage',
            name='page_ptr',
        ),
        migrations.DeleteModel(
            name='BlogPage',
        ),
    ]
