from django.db import models
from jsoneditor.fields.postgres_jsonfield import JSONField
from .validators import validate_zone


class BaseModel(models.Model):
    date_created = models.DateTimeField('Created at', auto_now_add=True)
    date_updated = models.DateTimeField('Updated at', auto_now=True)

    class Meta:
        abstract = True
        ordering = ['date_created']


class Location(BaseModel):

    name = models.CharField('Name', max_length=60, blank=False, null=False)

    def __str__(self):
        return self.name


class ZoneModel(BaseModel):

    name = models.CharField('Name', max_length=60, blank=False, null=False)

    model = JSONField('Model', validators=[validate_zone], blank=False, null=False)


class Project(BaseModel):

    name = models.CharField('Name', max_length=60, blank=False, null=False)

    description = models.CharField('Description', max_length=60, blank=False, null=False)

    transitions = models.ManyToManyField('Transition', verbose_name='Transitions')

    def __str__(self):
        return self.name


class Product(BaseModel):
    name = models.CharField('Name', max_length=60, blank=False, null=False)

    price = models.DecimalField('Price', max_digits=6, decimal_places=2)

    def __str__(self):
        return self.name


class Transition(BaseModel):

    name = models.CharField('Name', max_length=30, blank=False, null=False)

    fromZone = models.OneToOneField('Zone', verbose_name='From zone', related_name='+')
    toZone = models.OneToOneField('Zone', verbose_name='To zone', related_name='+')

    def __str__(self):
        return "%s: %s => %s" % (self.name, self.fromZone, self.toZone)

    def __unicode__(self):
        return "%s: %s => %s" % (self.name, self.fromZone, self.toZone)


class DoorType(BaseModel):
    name = models.CharField('Name', max_length=30, blank=False, null=False)

    products = models.ManyToManyField('Product')


class Zone(BaseModel):
    name = models.CharField('Name', max_length=60, blank=False, null=False)
    level = models.IntegerField(blank=False, null=False, default=1)

    def __str__(self):
        return self.name


    def __unicode__(self):
        return self.name


class Item(BaseModel):
    text = models.CharField('Name', max_length=60, blank=False, null=False)
    date_posted = models.DateField(auto_now=True)
