# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import wagtail.wagtailcore.blocks
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('testapp', '0003_auto_20150814_0905'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tpage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(icon=b'image')), (b'image_carousel', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'image', wagtail.wagtailimages.blocks.ImageChooserBlock()), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False))]), template=b'testapp/t_page.html', icon=b'image'))]),
        ),
    ]
