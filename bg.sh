sed -i '' 's/GREEN/BLUE/g' views/index.jade
cf push Blue -n womack-express
# Change HTML to say Green
sed -i '' 's/BLUE/GREEN/g' views/index.jade
cf push Green -n womack-express-green
# Apps both have routes 
# This gives us time to run automated & manual tests against Green until we're confident. 
cf map-route Green cfapps.io -n womack-express
# This allows us to do A/B Testing
# cf unmap-route Blue cfapps.io -n womack-express
