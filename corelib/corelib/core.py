import pendulum
from apputil import hi

def now():
  return hi.say() + "it is "+pendulum.now('Europe/Paris').format('dddd Do [of] MMMM YYYY HH:mm:ss A')
