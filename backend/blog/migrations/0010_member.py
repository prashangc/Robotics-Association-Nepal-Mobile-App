# Generated by Django 4.0.2 on 2022-03-01 05:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_year'),
    ]

    operations = [
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('picture', models.ImageField(blank=True, upload_to='members_images')),
                ('position', models.CharField(max_length=150)),
                ('year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.year')),
            ],
        ),
    ]