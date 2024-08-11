from django.db import models

# Create your models here.

class tb_role(models.Model):
    roleid = models.IntegerField(primary_key=True)
    role = models.CharField(max_length=50)
    
    def __str__(self):
        return self.role
    

class tb_thread(models.Model):
    threadid = models.AutoField(primary_key=True)
    title = models.CharField(max_length=50)
    def __str__(self):
        return self.title

class tb_history(models.Model):
    msgid = models.AutoField(primary_key=True)
    threadid = models.IntegerField()
    roleid = models.IntegerField()
    question = models.TextField()
    answer = models.TextField()
    def __str__(self):
        return self.question

