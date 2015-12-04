# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0005_informationpage'),
        ('wagtailimages', '0006_add_verbose_names'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('event', '0004_auto_20151201_1011'),
    ]

    operations = [
        migrations.DeleteModel(
            name='watchlist',
        ),
    ]
