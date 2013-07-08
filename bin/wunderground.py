#!/usr/bin/env python
# -*- coding: utf-8

"""
DESCRIPTION
  Get current temperature in degrees of Celsius for selected location.
  You will need an API key registered at the following site. See API details at
  http://api.wunderground.com/weather/api/d/docs for specifying the location,
  too.
"""

import argparse
import json
import urllib2

from wunderground_site import API_KEY

URL_TEMPLATE = ('http://api.wunderground.com/api/'
                '%s/geolookup/conditions/lang:%s/q/%s.json')


def parse_arguments():
    description = __doc__
    parser = argparse.ArgumentParser(
        description=description,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('-l', '--location', default='pws:IBUDAPES26',
                        help='location identifier (f.i.: pws:IBUDAPES26)')
    parser.add_argument('-L', '--language', default='HU',
                        help='language code (f.i.: HU)')

    return parser.parse_args()


def main():
    args = parse_arguments()

    response = None
    try:
        url_to_query = URL_TEMPLATE % (API_KEY, args.language, args.location)
        response = urllib2.urlopen(url_to_query)
    except urllib2.URLError:
        pass

    if response:
        json_string = response.read()
        parsed_json = json.loads(json_string)

        temp_c = parsed_json['current_observation']['temp_c']
        weather = parsed_json['current_observation']['weather']

        print('%s°C (%s)' % (str(temp_c), weather.encode('utf-8')))

        response.close()
    else:
        print('N/A')


if __name__ == '__main__':
    main()
