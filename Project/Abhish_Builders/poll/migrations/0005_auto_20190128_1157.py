# Generated by Django 2.1.5 on 2019-01-28 06:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('poll', '0004_property_details_propertyi'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='property_details',
            name='propertyi',
        ),
        migrations.AlterField(
            model_name='property_details',
            name='about_location',
            field=models.CharField(max_length=350),
        ),
        migrations.AlterField(
            model_name='property_details',
            name='facilities',
            field=models.CharField(max_length=350),
        ),
        migrations.AlterField(
            model_name='property_details',
            name='property_details',
            field=models.CharField(max_length=350),
        ),
    ]
