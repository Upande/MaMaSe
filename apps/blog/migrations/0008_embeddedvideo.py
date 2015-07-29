# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0007_auto_20150729_1153'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmbeddedVideo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(help_text=b'Video title', max_length=255)),
                ('video_link', models.URLField(verbose_name=b'External link', blank=True)),
            ],
        ),
    ]
