# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('knowledgeplatform', '0005_auto_20160106_0924'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursepage',
            name='acknowledgements',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Acknowledgements', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='books',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Schedule', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='description',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Description', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='documents',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Documents', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='forwhom',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'For Whom?', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='lecturer',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Lecturer', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='objectives',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Learning Objectives', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='shortcourses',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Short Courses', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='slides',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Books', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='software',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Software', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='thanks',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Thanks', blank=True),
        ),
        migrations.AddField(
            model_name='coursepage',
            name='training',
            field=wagtail.wagtailcore.fields.RichTextField(verbose_name=b'Tailor Made Trainings', blank=True),
        ),
    ]
