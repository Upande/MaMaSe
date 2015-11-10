# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0004_auto_20151110_0957'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChannelField',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.TextField()),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('channel', models.ForeignKey(related_name='channels', to='utils.Channel')),
                ('field', models.ForeignKey(related_name='field', to='utils.Field')),
            ],
        ),
        migrations.RemoveField(
            model_name='feed',
            name='channel',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field',
        ),
        migrations.AddField(
            model_name='feed',
            name='channelfield',
            field=models.ForeignKey(related_name='channels', blank=True, to='utils.ChannelField', null=True),
        ),
    ]
