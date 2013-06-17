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
    stdscr = curses.initscr()

    stdscr.keypad(True)
    curses.noecho()
    curses.cbreak()

    curses.curs_set(CURSOR_VISIBILITY_INVISIBLE)

    return stdscr


def end_curses(stdscr):
    curses.curs_set(CURSOR_VISIBILITY_NORMAL)

    curses.nocbreak()
    curses.echo()
    stdscr.keypad(False)

    curses.endwin()


def wait_for_keypress(stdscr):
    try:
        stdscr.getch()
    except KeyboardInterrupt:
        pass


def get_random_line(file_path):
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
    """
    Split the original line to an array of lines with max_length specified.
    The original line is split by whitespace (at word boundaries).
    Return an array containing the lines.
    """

    line = ''
    array_of_lines_to_return = []
    for word in original_line.split():
        line_length = len(line)
        word_length = len(word)
        if line_length + 1 + word_length > max_length:
            # no more words fit on this line
            array_of_lines_to_return.append(line)
            # initialize the new line
            line = word
        else:
            # word fits on this line, append this word to the end of line
            line = line + ' ' + word
            if line.startswith(' '):
                line = line.lstrip()

    if line:
        # hanging line
        array_of_lines_to_return.append(line)

    return array_of_lines_to_return


def print_centered(stdscr, lines):
    (rows, columns) = stdscr.getmaxyx()

    number_of_lines = len(lines)
    vertical_offset = (rows - number_of_lines) / 2

    for line in lines:
        horizontal_offset = (columns - len(line)) / 2
        stdscr.addstr(vertical_offset, horizontal_offset, line)
        vertical_offset += 1


def main():
    selected_line = get_random_line(QUOTE_FILE_PATH)
    selected_line_split = split_line(selected_line, MAX_TEXT_WIDTH)

    stdscr = init_curses()
    print_centered(stdscr, selected_line_split)
    wait_for_keypress(stdscr)
    end_curses(stdscr)


if __name__ == '__main__':
    main()
