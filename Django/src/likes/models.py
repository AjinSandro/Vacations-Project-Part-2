from django.db import models
# Create your models here.

class Like(models.Model):
    user = models.ForeignKey("api.Users", on_delete=models.DO_NOTHING)
    vacation = models.ForeignKey("vacations.VacationModel", on_delete=models.DO_NOTHING,related_name="likes")
    class Meta:
        unique_together = ('user', 'vacation')  # Ensures a user can like a vacation only once
        db_table="likes"