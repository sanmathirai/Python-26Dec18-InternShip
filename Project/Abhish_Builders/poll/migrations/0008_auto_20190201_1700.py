# Generated by Django 2.1.5 on 2019-02-01 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('poll', '0007_about_company'),
    ]

    operations = [
        migrations.AlterField(
            model_name='about_company',
            name='email',
            field=models.CharField(blank=True, max_length=25),
        ),
    ]