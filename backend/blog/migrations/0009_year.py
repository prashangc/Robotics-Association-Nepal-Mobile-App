# Generated by Django 4.0.2 on 2022-03-01 04:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0008_delete_allhomescreencomponents'),
    ]

    operations = [
        migrations.CreateModel(
            name='Year',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year_title', models.CharField(max_length=150)),
            ],
        ),
    ]
