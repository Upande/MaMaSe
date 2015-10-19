# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import jsonfield.fields
from django.utils.timezone import utc


class Migration(migrations.Migration):

    replaces = [(b'utils', '0001_initial'), (b'utils', '0002_emailrecipient'), (b'utils', '0003_email'), (b'utils', '0004_auto_20150910_0915'), (b'utils', '0005_auto_20150914_0655'), (b'utils', '0006_auto_20150916_0800'), (b'utils', '0007_auto_20150916_0802'), (b'utils', '0008_remove_feed_created_at'), (b'utils', '0009_auto_20150917_0750'), (b'utils', '0010_auto_20150917_0821'), (b'utils', '0011_auto_20150922_0857'), (b'utils', '0012_aggregatedailyfeed_aggregatemonthlyfeed'), (b'utils', '0013_auto_20151006_1147'), (b'utils', '0014_feed_lastupdate'), (b'utils', '0015_auto_20151008_0946'), (b'utils', '0016_auto_20151009_0831')]

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Channel',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data_id', models.IntegerField(unique=True)),
                ('name', models.TextField()),
                ('description', models.TextField()),
                ('latitide', models.FloatField()),
                ('longitude', models.FloatField()),
                ('created_at', models.DateTimeField()),
                ('updated_at', models.DateTimeField()),
                ('elevation', models.TextField()),
                ('last_entry_id', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Feed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('entry_id', models.IntegerField()),
                ('channel', models.ForeignKey(related_name='channels', to='utils.Channel')),
                ('timestamp', models.DateTimeField()),
                ('field1', models.FloatField(default=0.0, null=True, blank=True)),
                ('field2', models.FloatField(default=0.0, null=True, blank=True)),
                ('field3', models.FloatField(default=0.0, null=True, blank=True)),
                ('field4', models.FloatField(default=0.0, null=True, blank=True)),
                ('field5', models.FloatField(default=0.0, null=True, blank=True)),
                ('field6', models.FloatField(default=0.0, null=True, blank=True)),
                ('field7', models.FloatField(default=0.0, null=True, blank=True)),
                ('field8', models.FloatField(default=0.0, null=True, blank=True)),
                ('lastupdate', models.DateTimeField(default=datetime.datetime(2015, 10, 8, 7, 39, 8, 775215, tzinfo=utc), auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='LoggerData',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('raw_data', jsonfield.fields.JSONField()),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='EmailRecipient',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('role', models.CharField(max_length=200)),
                ('name', models.CharField(max_length=200)),
                ('email', models.CharField(max_length=200)),
                ('active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Email',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sender', models.CharField(max_length=200)),
                ('email', models.CharField(max_length=200)),
                ('subject', models.CharField(max_length=255)),
                ('message', models.TextField()),
                ('sent', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.AddField(
            model_name='channel',
            name='field1',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field2',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field3',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field4',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field5',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field6',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field7',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='field8',
            field=models.TextField(default=b'', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='channel',
            name='username',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='channel',
            name='last_entry_id',
            field=models.IntegerField(default=0),
        ),
        migrations.RenameField(
            model_name='channel',
            old_name='latitide',
            new_name='latitude',
        ),
        migrations.AlterField(
            model_name='channel',
            name='updated_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.CreateModel(
            name='AggregateDailyFeed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data', jsonfield.fields.JSONField(null=True, blank=True)),
                ('lastupdate', models.DateTimeField(auto_now_add=True)),
                ('timestamp', models.DateTimeField()),
                ('channel', models.ForeignKey(related_name='daily_channels', to='utils.Channel')),
                ('aggregation', models.CharField(default=b'Count', max_length=15, choices=[(b'COUNT', b'Count'), (b'SUM', b'Sum'), (b'MIN', b'Min'), (b'MAX', b'Max'), (b'AVG', b'Avg')])),
            ],
        ),
        migrations.CreateModel(
            name='AggregateMonthlyFeed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('data', jsonfield.fields.JSONField(null=True, blank=True)),
                ('lastupdate', models.DateTimeField(auto_now_add=True)),
                ('timestamp', models.DateTimeField()),
                ('channel', models.ForeignKey(related_name='monthly_channels', to='utils.Channel')),
                ('aggregation', models.CharField(default=b'Count', max_length=15, choices=[(b'COUNT', b'Count'), (b'SUM', b'Sum'), (b'MIN', b'Min'), (b'MAX', b'Max'), (b'AVG', b'Avg')])),
            ],
        ),
    ]
