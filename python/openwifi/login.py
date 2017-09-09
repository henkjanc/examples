import urllib


login_url = 'https://clearpass.vanderlande.com/guest/vanderlande-agreement.php?_browser=1'


# Get login page
login_html = urllib.open(login_url)

# post accept
login_form_data = {
  'user':'guestwifi-anonymous'
  'password':'019927'
  'url':'https://www.vanderlande.com'
  'cmd':'authenticate'
  'Login':'Log In' }

form:wq
