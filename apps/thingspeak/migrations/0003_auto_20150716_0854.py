# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('thingspeak', '0002_channel_feeds'),
    ]

    operations = [
        migrations.AddField(
            model_name='channel',
            name='field10',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field4',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field5',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field6',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field7',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field8',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='channel',
            name='field9',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='feeds',
            name='field10',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='feeds',
            name='field6',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='feeds',
            name='field7',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='feeds',
            name='field8',
            field=models.TextField(default=b''),
        ),
        migrations.AddField(
            model_name='feeds',
            name='field9',
            field=models.TextField(default=b''),
        ),
        migrations.AlterField(
            model_name='channel',
            name='field1',
            field=models.TextField(default=b''),
        ),
        migrations.AlterField(
            model_name='channel',
            name='field2',
            field=models.TextField(default=b''),
        ),
        migrations.AlterField(
            model_name='channel',
            name='field3',
            field=models.TextField(default=b''),
        ),
    ]
