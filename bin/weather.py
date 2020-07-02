#!/usr/bin/env python

"""
DESCRIPTION
  Get current temperature in degrees of Celsius for selected location.
  You will need an API key registered at https://openweathermap.org.
  See API details at https://openweathermap.org/api.

BUGS
  GNU Screen 4.03.01 and latest development version (4.1.0devel) still cannot
  handle UTF-8 correctly in the status line.
  Some relevant bug reports: http://savannah.gnu.org/bugs/?39330,
  http://savannah.gnu.org/bugs/?18505, http://savannah.gnu.org/bugs/?36172.
"""

from __future__ import print_function

import argparse
import json
import sys
import urllib2

from weather_site import API_KEY

URL_TEMPLATE = 'https://api.openweathermap.org/data/2.5/weather?q={}&units=metric&appid={}'


def main():
    args = parse_arguments()
    degree_sign = get_degree_sign(args.no_degree_sign, args.screen)

    response = None
    try:
        url_to_query = URL_TEMPLATE.format(args.location, API_KEY)
        debug(args.debug, "URL = {}".format(url_to_query))
        response = urllib2.urlopen(url_to_query)
        debug(args.debug, "response = {}".format(response))
    except urllib2.URLError:
        pass

    if response:
        json_string = response.read()
        debug(args.debug, "json string = {}".format(json_string))
        response.close()

        parsed_json = json.loads(json_string)
        debug(args.debug, "parsed json = {}".format(parsed_json))
        if parsed_json:
            if 'main' in parsed_json and 'temp' in parsed_json['main']:
                temp_c = float(parsed_json['main']['temp'])
                debug(args.debug, "temp (C) = {}".format(temp_c))
                weather = None
                if 'weather' in parsed_json and parsed_json['weather'] and \
                        'description' in parsed_json['weather'][0]:
                    weather = parsed_json['weather'][0]['description']
                    debug(args.debug, "weather = {}".format(weather))

                string_to_display = '{:.1f}{}C'.format(temp_c, degree_sign)
                if weather:
                    string_to_display += ' ({})'.format(' '.join(
                        word.capitalize() for word in weather.split()))
                print(string_to_display)
                return
    print('N/A')


def parse_arguments():
    description = __doc__
    parser = argparse.ArgumentParser(
        description=description,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        '-d', '--debug', action='store_true',
        help='enable debug mode (default: %(default)s)')
    group.add_argument(
        '-s', '--screen', action='store_true',
        help='use degree sign for the buggy GNU Screen 4.00 '
             'status line (default: %(default)s)')
    group.add_argument(
        '-n', '--no-degree-sign', action='store_true',
        help='do not use degree sign at all (for the buggy GNU Screen 4.01 '
             'status line, default: %(default)s)')
    parser.add_argument(
        '-l', '--location', default='Budapest,HU',
        help='location identifier (default: %(default)s) '
             'See https://openweathermap.org/current and '
             'https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes')

    return parser.parse_args()


def get_degree_sign(do_not_print_degree_sign, degree_sign_for_screen):
    if do_not_print_degree_sign:
        return ''
    if degree_sign_for_screen:
        return '\xb0'
    return '\xc2\xb0'


def debug(do_debug, message):
    if do_debug:
        print(message, file=sys.stderr, end='\n')


if __name__ == '__main__':
    main()
