#!/usr/bin/perl

# Copyright 2013 Charles Herbig
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# Goes through all the files in the given directories and renames files with
# spaces in their names with underscores.

use warnings;

sub usage {
	print "Usage: despace [-h] [directory ...]\n";
	exit 0;
}

if ( $ARGV[0] eq "-h" ) {
	&usage ;
}

foreach $mydir (@ARGV) {
	opendir DH, $mydir or die "Cannot open $mydir: $!";
	foreach $file (readdir DH) {
		$_=$file;
		s/ /_/;
		$newname=$_;
		if ( $file ne $newname ) {
			rename("$mydir/$file", "$mydir/$newname");
		}
	}
	closedir DH;
}

