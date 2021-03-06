# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2017-08-13 11:30
from __future__ import unicode_literals

import django.contrib.postgres.fields.jsonb
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DoorType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, verbose_name='Name')),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.CharField(max_length=60, verbose_name='Name')),
                ('date_posted', models.DateField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, verbose_name='Name')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, verbose_name='Name')),
                ('price', models.DecimalField(decimal_places=2, max_digits=6, verbose_name='Price')),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, verbose_name='Name')),
                ('description', models.CharField(max_length=60, verbose_name='Description')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Transition',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, verbose_name='Name')),
            ],
        ),
        migrations.CreateModel(
            name='Zone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, verbose_name='Name')),
                ('level', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='ZoneModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, verbose_name='Name')),
                ('model', django.contrib.postgres.fields.jsonb.JSONField(verbose_name='Model')),
            ],
        ),
        migrations.AddField(
            model_name='transition',
            name='fromZone',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='+', to='todo.Zone', verbose_name='From zone'),
        ),
        migrations.AddField(
            model_name='transition',
            name='toZone',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='+', to='todo.Zone', verbose_name='To zone'),
        ),
        migrations.AddField(
            model_name='project',
            name='transitions',
            field=models.ManyToManyField(to='todo.Transition', verbose_name='Transitions'),
        ),
        migrations.AddField(
            model_name='doortype',
            name='products',
            field=models.ManyToManyField(to='todo.Product'),
        ),
    ]
