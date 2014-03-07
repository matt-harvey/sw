Legal
=====

Copyright (c) 2014 Matthew Harvey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Usage
=====

``sw`` is a simple command line based stopwatch utility.

It is designed to be particularly useful for employees and contractors who need
to enter starting and finishing times into a timesheet (in terms of hours and
minutes) but also need a calculation (in terms of decimal fractions) of the
total number of hours they have worked.

Typical usage for building a timesheet:

- At the start of the working day, enter ``sw reset`` (to ensure the stopwatch
  is reset to zero), followed to ``sw start``.
- When you go on a lunch break or other break, enter ``sw stop``.
- When you come back from a break, enter ``sw start`` again.
- When you finish your day, enter ``sw reset``.

On being reset - or on entering ``sw stats`` - the program will output a
summary of starting and stopping times, the total hours elapsed ignoring breaks,
the total duration of breaks, and the total hours elapsed net of breaks.

For a summary of usage, enter ``sw help``.

Dependencies
============

You need ``ruby``.

Installing
==========

On Unix-like systems, you can install ``sw`` from the command line as follows:

- ``chmod +x sw.rb``
- ``sudo cp sw.rb /usr/local/bin/sw`` (or copy to a different location as you
  see fit).

**NOTE** ``sw`` will also create a file called ``.sw.yml`` in your home folder,
the first time it is run. If a file with this name already exists, *it will be
clobbered*.

Uninstalling
============

You need to remove both the ``sw`` script, and the ``.sw.yml`` data file that
the program creates in your home directory.

On Unix-like systems, this can be done as follows:

- ``sudo rm /usr/local/bin/sw`` (or from wherever you installed it)
- ``rm ~/.sw.yml``

Known shortcomings
==================

- The program does not make a swap or backup of the ``.sw.yml`` data file. It
  probably should.
- There should probably be an install script that makes sure that there isn't
  already a file called ``.sw.yml`` in the user's home directory.
- It hasn't been formally tested.
- There is no way of manually entering start and finishing times. (Although you
  could always just open up ``.sw.yml`` and change the times therein - being
  careful to preserve the prescribed format for times. Note the first time in
  the list is the time the stopwatch was initially started, after the previous
  reset. The second time shows the first time it was stopped. Thereafter, times
  alternate between starting and stopping times.)

Contact
=======

You are welcome to contact me about this project at:

software@matthewharvey.net

