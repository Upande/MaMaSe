# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0006_delete_attendee'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventindexrelatedlink',
            name='page',
            field=modelcluster.fields.ParentalKey(related_name='related_links', blank=True, to='event.EventIndexPage', null=True),
        ),
    ]
