from django.core.exceptions import ValidationError

def validate_zone(value):
    if 'name' not in value:
        raise ValidationError("Name is manditory in JSON", params={'value':  value})
