#Enter latitude and longitude as command line arguemetns seperated by space

key= #Your Google Maps Geocoding API key here
data=$(curl -s  "https://maps.googleapis.com/maps/api/geocode/json?latlng=$1,$2&key=$key")

placeName=$(echo $data | grep -Eo '"formatted_address" : "([[:alnum:]]|[[:space:]]|,)+' | head -n 1 | sed 's/"formatted_address" : "//g')

echo -n $placeName