cf push Blue -n womack-express
# Change HTML to say Green
cf push Green -n womack-express-green
# Apps both have routes 
# This gives us time to run automated & manual tests against Green until we're confident. 
cf map-route Green cfapps.pez.pivotal.io -n womack-express
# This allows us to do A/B Testing
cf unmap-route Blue cfapps.pez.pivotal.io -n womack-express
