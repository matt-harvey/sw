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

Overview
========

``sw`` is a command line stopwatch utility.

Dependencies
============

You need ``ruby``.

Installing
==========

On Unix-like systems, you can install ``sw`` as follows:

- ``chmod +x sw.rb``
- ``sudo cp sw.rb /usr/local/bin/sw`` (or copy to a different location as you
  see fit).

Note ``sw`` will also create a file called ``.sw`` in your home folder, the
first time it is run. If such a file already exists, *it will be clobbered*.

Uninstalling
============

You need to remove both the ``sw`` script, and the ``.sw`` data file that
the program creates in your home directory.

On Unix-like systems, this can be done as follows:

- ``sudo rm /usr/local/bin/sw`` (or from wherever you installed it)
- ``rm ~/.sw``

Usage
=====

Enter ``sw help`` to see a summary of usage.

Contact
=======

You are welcome to contact me about this project at:

sw@matthewharvey.net

