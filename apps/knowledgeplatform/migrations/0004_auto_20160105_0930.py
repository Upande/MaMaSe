# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import wagtail.wagtailcore.blocks
import wagtail.wagtailembeds.blocks
import wagtail.wagtaildocs.blocks
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('knowledgeplatform', '0003_knowledgepage_course_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='knowledgepage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'paragraph', wagtail.wagtailcore.blocks.RichTextBlock()), (b'urls', wagtail.wagtailcore.blocks.URLBlock()), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock()), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock()), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock())]),
        ),
    ]
