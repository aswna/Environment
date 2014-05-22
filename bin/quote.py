#!/usr/bin/env python

"""
Select random quote from the quotes.txt file.
Print the selected quote aligned to the center of the screen.
"""

import curses
import os
import random


QUOTE_FILE_PATH = '~/etc/quotes.txt'
MAX_TEXT_WIDTH = 62

CURSOR_VISIBILITY_INVISIBLE = 0
CURSOR_VISIBILITY_NORMAL = 1


def init_curses():
    """ Initialize curses session. """
    stdscr = curses.initscr()

    stdscr.keypad(True)
    curses.noecho()
    curses.cbreak()

    curses.curs_set(CURSOR_VISIBILITY_INVISIBLE)

    return stdscr


def end_curses(stdscr):
    """ End our curses session. """
    curses.curs_set(CURSOR_VISIBILITY_NORMAL)

    curses.nocbreak()
    curses.echo()
    stdscr.keypad(False)

    curses.endwin()


def wait_for_keypress(stdscr):
    """ Wait for keypress in stdscr curses session. """
    try:
        stdscr.getch()
    except KeyboardInterrupt:
        pass


def get_random_line(file_path):
    """ Get random line from file at file_path. """
    lines = []
    try:
        for line in open(os.path.expanduser(file_path)):
            lines.append(line)
    except IOError:
        lines.append('Could not open file: %s' % file_path)

    number_of_lines = len(lines)
    if number_of_lines < 1:
        lines.append('Empty file: %s' % file_path)
        index = 0
    else:
        index = random.randint(0, number_of_lines - 1)

    return lines[index]


def split_line(original_line, max_length):
    """ Split the original line to an array of lines with max_length specified.

    The original line is split by whitespace (at word boundaries).
    Return an array containing the lines.

    """

    line = ''
    array_of_lines_to_return = []
    for word in original_line.split():
        line_length = len(line)
        word_length = len(word)
        if line_length + 1 + word_length <= max_length:
            # word fits on this line, append this word to the end of line
            line = line + ' ' + word
            if line.startswith(' '):
                line = line.lstrip()
        else:
            # no more words fit on this line
            array_of_lines_to_return.append(line)
            # initialize the next line
            line = word

    if line:
        # hanging line
        array_of_lines_to_return.append(line)

    return array_of_lines_to_return


def calculate_vertical_offset(stdscr, lines):
    """ Calculate vertical offset for the first (top) line to be printed. """
    (rows, _columns) = stdscr.getmaxyx()
    number_of_lines = len(lines)
    vertical_offset = int((rows - number_of_lines) / 2)
    if vertical_offset < 0:
        vertical_offset = 0
    return vertical_offset


def print_lines_centered_at_vertical_offset(stdscr, lines, vertical_offset):
    """ Print given lines centered. Start at given positions. """
    (rows, columns) = stdscr.getmaxyx()
    for line in lines:
        horizontal_offset = int((columns - len(line)) / 2)
        stdscr.addstr(vertical_offset, horizontal_offset, line)
        vertical_offset += 1
        if vertical_offset >= rows:
            break


def print_centered(stdscr, lines):
    """ Print given lines centered on stdscr curses session. """
    vertical_offset = calculate_vertical_offset(stdscr, lines)
    print_lines_centered_at_vertical_offset(stdscr, lines, vertical_offset)


def main():
    """ Select random quote from file and print it centered on screen. """
    stdscr = init_curses()
    (_rows, columns) = stdscr.getmaxyx()
    max_text_width = min(MAX_TEXT_WIDTH, columns - 1)

    selected_line = get_random_line(QUOTE_FILE_PATH)
    selected_line_split = split_line(selected_line, max_text_width)

    print_centered(stdscr, selected_line_split)
    wait_for_keypress(stdscr)
    end_curses(stdscr)


if __name__ == '__main__':
    main()
