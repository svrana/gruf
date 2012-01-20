Gruf 
====

A collection of scripts to help productivity when dealing with
Projects.  Probably only applicable to those of us working from the
command line and without an IDE.

Example Usage:
--------------

Suppose you're working on some code in directory
/work/company/project/moriarity/rls5/bug100.

#### Change project to 'bug100'

	chp bug100

#### Open file ReservationsTab.java that is somewhere in the bug100 directory

	pvi ReservationsTab.java 

#### Change directory to /work/company/project/moriarity/rls5/bug100.

	cdp

Integration shortcuts for vim included.


Howto
-----

1. Source gruf.bashrc from your .bashrc
2. Source gruf.vimrc from your .vimrc
3. Add $GRUF_PROJECT to your $PATH
4. Modify gruf.bashrc to your liking (optional)
5. Run tlc in your project directory.

[Shaw Vrana](http://vranix.com/).
