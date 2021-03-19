# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-06-19 09:06
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtaildocs', '0007_merge'),
        ('wagtailcore', '0028_merge'),
        ('wagtailimages', '0013_make_rendition_upload_callable'),
        ('knowledgeplatform', '0012_coursepage_category'),
    ]

    operations = [
        migrations.CreateModel(
            name='CIWABPage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('author', models.CharField(max_length=255)),
                ('date', models.DateField(verbose_name=b'Post date')),
                ('description', wagtail.wagtailcore.fields.RichTextField(blank=True, verbose_name=b'Description')),
                ('body', wagtail.wagtailcore.fields.RichTextField(blank=True, verbose_name=b'Body')),
                ('category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='knowledgeplatform.CourseCategoryPage')),
                ('course_image', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtailimages.Image')),
                ('document', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtaildocs.Document')),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
    ]