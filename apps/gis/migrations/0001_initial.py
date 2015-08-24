# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.backends.base.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='PostGISGeometryColumns',
            fields=[
                ('f_table_catalog', models.CharField(max_length=256)),
                ('f_table_schema', models.CharField(max_length=256)),
                ('f_table_name', models.CharField(max_length=256)),
                ('f_geometry_column', models.CharField(max_length=256)),
                ('coord_dimension', models.IntegerField()),
                ('srid', models.IntegerField(serialize=False, primary_key=True)),
                ('type', models.CharField(max_length=30)),
            ],
            options={
                'db_table': 'geometry_columns',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PostGISSpatialRefSys',
            fields=[
                ('srid', models.IntegerField(serialize=False, primary_key=True)),
                ('auth_name', models.CharField(max_length=256)),
                ('auth_srid', models.IntegerField()),
                ('srtext', models.CharField(max_length=2048)),
                ('proj4text', models.CharField(max_length=2048)),
            ],
            options={
                'db_table': 'spatial_ref_sys',
                'managed': False,
            },
            bases=(models.Model, django.contrib.gis.db.backends.base.models.SpatialRefSysMixin),
        ),
    ]
