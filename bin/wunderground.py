#!/usr/bin/env python

"""
DESCRIPTION
  Get current temperature in degrees of Celsius for selected location.
  You will need an API key registered at the following site. See API details at
  http://api.wunderground.com/weather/api/d/docs for specifying the location,
  too.

BUGS
  GNU Screen 4.00.03 and latest development version (4.1.0devel) still cannot
  handle UTF-8 correctly in the status line.
  Some relevant bug reports: http://savannah.gnu.org/bugs/?39330,
  http://savannah.gnu.org/bugs/?18505, http://savannah.gnu.org/bugs/?36172.
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
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-s', '--screen', action='store_true',
                       help='use degree sign for the buggy GNU Screen 4.00 '
                            'status line (default: %(default)s)')
    group.add_argument('-n', '--no-degree-sign', action='store_true',
                       help='do not use degree sign at all (for the buggy '
                            'GNU Screen 4.01 status line, '
                            'default: %(default)s)')
    parser.add_argument('-l', '--location', default='pws:IBUDAPES26',
                        help='location identifier (default: %(default)s)')
    parser.add_argument('-L', '--language', default='EN',
                        help='language code (default: %(default)s)')

    return parser.parse_args()


def get_degree_sign(do_not_print_degree_sign, degree_sign_for_screen):
    if do_not_print_degree_sign:
        return ''
    else:
        if degree_sign_for_screen:
            return '\xb0'
        else:
            return '\xc2\xb0'


def main():
    args = parse_arguments()
    degree_sign = get_degree_sign(args.no_degree_sign, args.screen)

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

        print('%s%sC (%s)' % (str(temp_c), degree_sign,
                              weather.encode('utf-8')))

        response.close()
    else:
        print('N/A')


if __name__ == '__main__':
    main()
