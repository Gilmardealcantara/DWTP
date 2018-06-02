# -*- coding: utf-8 -*-
# Script to convert lat/lon into Cidade-UF

import json
import pandas as pd
from geopy.geocoders import Nominatim
#from incf.countryutils import transformations

geolocator = Nominatim()

places_found = {}
locations = {}

with open('data/Countries/data/countries.json') as f:
    locations = json.load(f)


def get_addr(lat, lng, key):
	g = geolocator.reverse(lat + ',' + lng, language='en')
	if g is not None:
		code = g.raw['address'][key].upper()
		country = locations[code]['name']
		continent = locations[code]['continent']
		print("Find -> " + country + "/" + continent)
		return [country, continent]
	else:
		print("Country NOT Found")
		return ['', '']		

directions = {'N': '', 'S': '-', 'E': '', 'W': '-'}
def conv_coord(coor):
    lat = eval(coor)[0] 
    lng = eval(coor)[1]
    lat = str(lat).split('.')[0] + '.' + str(lat).split('.')[1][:2] # normalize 2 decimal casas
    lng = str(lng).split('.')[0] + '.' + str(lng).split('.')[1][:2] # normalize 2 decimal casas
    return [lat, lng]	


df = pd.read_csv('data/meteorite/meteorite-landings.csv')
df.insert(2, 'country', '');
df.insert(2, 'continent', '');

def update_df(vals, index):
	df['country'][index] = vals[0]
	df['continent'][index] = vals[1]


# count=0
for index, row in df.iterrows():
	try:
		#count+=1
		# if count == 10: break
		latlng = conv_coord(row.GeoLocation)
		lat = latlng[0]	
		lng = latlng[1]	
		if (lat, lng) in places_found:
			vals = places_found[(lat, lng)]
			update_df(vals, index)
		else:
			vals = get_addr(lat, lng, 'country_code')
			update_df(vals, index)
			places_found[(lat, lng)] = vals
	except Exception as ex:
		vals = ['', '']
		update_df(vals, index)
		places_found[(lat, lng)] = vals
		print(ex)

df.to_csv('output_meteorites.csv');



