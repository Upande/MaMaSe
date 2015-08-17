# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import modelcluster.fields
import modelcluster.contrib.taggit


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0001_initial'),
        ('video', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmbeddedVideoPageTag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content_object', modelcluster.fields.ParentalKey(related_name='tagged_items', to='video.EmbeddedVideoPage')),
                ('tag', models.ForeignKey(related_name='video_embeddedvideopagetag_items', to='taggit.Tag')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='embeddedvideopage',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(to='taggit.Tag', through='video.EmbeddedVideoPageTag', blank=True, help_text='A comma-separated list of tags.', verbose_name='Tags'),
        ),
    ]
