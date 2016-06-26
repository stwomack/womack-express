# Make sure app says BLUE
sed -i '' 's/GREEN/BLUE/g' views/index.jade
# Push Blue app
cf push Blue -n womack-express -b nodejs_buildpack
# Change HTML to say Green
sed -i '' 's/BLUE/GREEN/g' views/index.jade
# Push Green app
cf push Green -n womack-express-green -b nodejs_buildpack
# Apps both have routes 
# This gives us time to run automated & manual tests against Green until we're confident. 
cf map-route Green pcf1.fe.gopivotal.com -n womack-express
cf scale green -i 3
# This allows us to do A/B Testing
# cf unmap-route Blue pcf1.fe.gopivotal -n womack-express
