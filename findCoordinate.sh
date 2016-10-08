name=$1

key= #Your Google Geocoding API key here


query=$(echo $name | sed -r 's/([[:punct:]]+)/ /g' | sed 's/[[:space:]]/\+/g')
data="$(curl -s "https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$key")"
lat=$(echo "$data" | grep "lat" | head -n 3 | tail -n 1 | grep -Eo ".[[:digit:]]+\.[[:digit:]]+")
long=$(echo "$data" | grep "lng" | head -n 3 | tail -n 1 | grep -Eo ".[[:digit:]]+\.[[:digit:]]+")

echo $lat $long