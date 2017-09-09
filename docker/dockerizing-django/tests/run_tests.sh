# Unit tests
cd /usr/src/app
python manage.py test -v 2

# Integration tests
echo "Running various tests inside a container"
ping -c 1 nginx
if curl nginx | grep -q 'times!'; then
  echo "Django-server running"
else
  echo "Tests failed!"
  exit 1
fi
## Lint tests
prospector --zero-exit /usr/src/app



