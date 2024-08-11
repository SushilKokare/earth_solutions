from django.contrib import admin
from .models import tb_role, tb_thread, tb_history
# Register your models here.

admin.site.register(tb_role)
admin.site.register(tb_thread)
admin.site.register(tb_history)