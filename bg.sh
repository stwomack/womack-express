# Make sure app says BLUE
sed -i '' 's/GREEN/BLUE/g' views/index.jade
# Push blue app
cf push blue -n womack-express -b nodejs_buildpack -i 3
# Change HTML to say green
sed -i '' 's/BLUE/GREEN/g' views/index.jade
# Push green app
cf push green -n womack-express-green -b nodejs_buildpack
# Apps both have routes 
# This gives us time to run automated & manual tests against green until we're confident. 
cf map-route green cfapps.pez.pivotal.io -n womack-express
cf scale green -i 3
# This allows us to do A/B Testing
cf unmap-route blue cfapps.pez.pivotal.io -n womack-express

#cf map-route blue cfapps.pez.pivotal.io -n womack-express
