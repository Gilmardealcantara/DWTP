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
	val = coor[:len(coor) - 1]
	dr = coor[len(coor) - 1]
	return directions[dr] + val
		


df = pd.read_csv('data/eclipses/solar.csv')
df.insert(2, 'country', '');
df.insert(2, 'continent', '');

def update_df(vals, index):
	df['country'][index] = vals[0]
	df['continent'][index] = vals[1]


#count=0
for index, row in df.iterrows():
	try:
		#count+=1
		#if count == 10: break
		lat = conv_coord(row.Latitude)
		lng = conv_coord(row.Longitude)
		if (lat, lng) in places_found:
			vals = places_found[(lat, lng)]
			update_df(vals, index)
		else:
			vals = get_addr(str(lat), str(lng), 'country_code')
			update_df(vals, index)
			places_found[(lat, lng)] = vals
	except Exception as ex:
		vals = ['', '']
		update_df(vals, index)
		places_found[(lat, lng)] = vals
		print(ex)

df.to_csv('output_solar_eclipce.csv');



