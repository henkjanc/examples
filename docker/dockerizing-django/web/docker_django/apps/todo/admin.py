from django.contrib import admin

# Register your models here.
from .models import Project, Product, Zone, ZoneModel, Transition, DoorType

class BaseAdmin(admin.ModelAdmin):
    list_display = ['name', 'date_created', 'date_updated']


class ProjectAdmin(admin.ModelAdmin):
    list_display = ['name']


admin.site.register(Project, ProjectAdmin)
admin.site.register(Product, BaseAdmin)
admin.site.register(Zone, BaseAdmin)
admin.site.register(ZoneModel, BaseAdmin)
admin.site.register(Transition, BaseAdmin)
admin.site.register(DoorType, BaseAdmin)
