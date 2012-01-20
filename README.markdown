Gruf 
====

A collection of scripts to help productivity when dealing with
Projects.  Probably only applicable to those of us working from the
command line and without an IDE.

Example Usage:
--------------

Grab a copy of this project:

	git clone git://github.com/svrana/gruf.git ~/gruf

Configure gruf:
	
	cd ~/gruf
	source gruf.bashrc

Change your project to the gruf project:

	chp .

Goto your project directory:
	
	cdp

Load gruf.bashrc and set your $GRUF_PROJPATH:
	
	pvi bashrc

Create a filelist by typing:

	make-list

This will create a .filelist file with the full pathname of each file in your project.


Load vi and source ~/gruf/gruf.vimrc.  In command mode:

	\gf

When prompted for a file

	bashrc

hit enter.


Installation
-----

1. Source gruf.bashrc from your .bashrc
2. Source gruf.vimrc from your .vimrc
3. Add $GRUF_PROJECT to your $PATH
4. Modify gruf.bashrc to your liking (optional)
5. Run tlc in your project directory.

[Shaw Vrana](http://vranix.com/).
