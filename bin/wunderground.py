#!/usr/bin/env python
# -*- coding: utf-8

"""
DESCRIPTION
  Get current temperature in degrees of Celsius for selected location.
  You will need an API key registered at the following site. See API details at
  http://api.wunderground.com/weather/api/d/docs for specifying the location,
  too.

BUGS
  For some reason the degree sign is not printed correctly in GNU Screen
  status line. \\xc2\\xb0 looks correctly in the terminal, but not in the
  status line. \\xb0 looks correctly in the status line, but not in the
  terminal. To work around this problem a command line argument (flag) is
  introduced, see the help for the exact option.
"""

import argparse
import json
import urllib2

from wunderground_site import API_KEY

BASE_URL = 'http://api.wunderground.com/api/'
LOOKUP = '/geolookup/conditions/q/'


def parse_arguments():
    description = __doc__
    parser = argparse.ArgumentParser(
        description=description,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('-s', '--screen', action='store_true',
                        help='use degree sign for GNU Screen status line '
                             '(default: %(default)s)')
    parser.add_argument('-l', '--location', required=True,
                        help='location identifier (f.i.: pws:IBUDAPES26)')

    return parser.parse_args()


def get_degree_sign(degree_sign_for_screen):
    if degree_sign_for_screen:
        return '\xb0'
    else:
        return '\xc2\xb0'


def main():
    args = parse_arguments()
    degree_sign = get_degree_sign(args.screen)

    response = None
    try:
        query = args.location + '.json'
        response = urllib2.urlopen(BASE_URL+API_KEY+LOOKUP+query)
    except urllib2.URLError:
        pass

    if response:
        json_string = response.read()
        parsed_json = json.loads(json_string)

        temp_c = parsed_json['current_observation']['temp_c']
        weather = parsed_json['current_observation']['weather']

        print('%s%sC (%s)' % (str(temp_c), degree_sign,
                              weather.encode('utf-8')))

        response.close()
    else:
        print('N/A')


if __name__ == '__main__':
    main()
