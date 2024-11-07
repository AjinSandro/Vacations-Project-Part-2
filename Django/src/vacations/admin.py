from django.contrib.admin import ModelAdmin , site
from .models import VacationModel

# Register your models here.


class VacationAdmin(ModelAdmin):
    list_display = ("vacation_id","country_id","vacation_details","vacation_date_start","vacation_date_end","vacation_price","vacation_picture_file")

site.register(VacationModel,VacationAdmin)
