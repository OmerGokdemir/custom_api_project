#!/bin/bash

echo "Waiting for PostgreSQL..."
sleep 5

# Migrate
python manage.py migrate

# Create superuser using environment variables
echo "Creating superuser..."
DJANGO_SUPERUSER_USERNAME=${DJANGO_SUPERUSER_USERNAME:-admin}
DJANGO_SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-admin@example.com}
DJANGO_SUPERUSER_PASSWORD=${DJANGO_SUPERUSER_PASSWORD:-admin1234}

python manage.py shell << END
from django.contrib.auth import get_user_model

User = get_user_model()
username = "$DJANGO_SUPERUSER_USERNAME"
email = "$DJANGO_SUPERUSER_EMAIL"
password = "$DJANGO_SUPERUSER_PASSWORD"

if not User.objects.filter(email=email).exists():
    User.objects.create_superuser(
        username=username,
        email=email,
        password=password
    )
    print("Superuser created.")
else:
    print("Superuser already exists.")
END

# Run server
echo 'Initialising server...'
exec python manage.py runserver 0.0.0.0:8000
