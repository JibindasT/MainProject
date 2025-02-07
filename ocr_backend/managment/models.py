from django.db import models

# Create your models here.
class Member(models.Model):
    u_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=150, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone_no = models.CharField(max_length=15)

    def __str__(self):
        return self.username

class Annotation(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ]
    ann_id = models.AutoField(primary_key=True)
    inpt_image = models.ImageField(upload_to='annotations/')
    inpt_text = models.TextField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')

    def __str__(self):
        return f"Annotation {self.ann_id} - {self.status}"

class owner(models.Model):
    ad_id = models.AutoField(primary_key=True)  # Explicit primary key
    username = models.CharField(max_length=150, unique=True)
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.username

