# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0012_aggregatedailyfeed_aggregatemonthlyfeed'),
    ]

    operations = [
        migrations.AddField(
            model_name='aggregatedailyfeed',
            name='aggregation',
            field=models.CharField(default=b'Count', max_length=15, choices=[(b'COUNT', b'Count'), (b'SUM', b'Sum'), (b'MIN', b'Min'), (b'MAX', b'Max'), (b'AVG', b'Avg')]),
        ),
        migrations.AddField(
            model_name='aggregatemonthlyfeed',
            name='aggregation',
            field=models.CharField(default=b'Count', max_length=15, choices=[(b'COUNT', b'Count'), (b'SUM', b'Sum'), (b'MIN', b'Min'), (b'MAX', b'Max'), (b'AVG', b'Avg')]),
        ),
    ]
