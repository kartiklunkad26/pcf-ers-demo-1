test_url=http://attendees-citi-canary.cfapps.io/basics
urlstatus=$(curl -o /dev/null --silent --head --write-out '%{http_code}' ${test_url})
code=404
if [ $urlstatus = $code ]
then
  exit 1
fi