# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0002_auto_20151015_0729'),
    ]

    operations = [
        migrations.CreateModel(
            name='Field',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.TextField(unique=True)),
                ('added', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field1',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field2',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field3',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field4',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field5',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field6',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field7',
        ),
        migrations.RemoveField(
            model_name='channel',
            name='field8',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field1',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field2',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field3',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field4',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field5',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field6',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field7',
        ),
        migrations.RemoveField(
            model_name='feed',
            name='field8',
        ),
        migrations.AddField(
            model_name='feed',
            name='reading',
            field=models.FloatField(default=0.0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='feed',
            name='field',
            field=models.ForeignKey(related_name='fields', default='', to='utils.Field'),
            preserve_default=False,
        ),
    ]
