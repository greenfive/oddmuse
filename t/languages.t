# Copyright (C) 2006  Alex Schroeder <alex@emacswiki.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 't/test.pl';
package OddMuse;
use Test::More tests => 5;
use utf8; # tests contain UTF-8 characters and it matters

%Languages = ('de' => '\b(der|die|das|und|oder)\b',
	      'fr' => '\b(et|le|la|pas)\b', );

is(GetLanguages('This is English text and cannot be identified.'), '', 'unknown language');
is(GetLanguages('Die Katze tritt die Treppe krumm.'), '', 'not enough German words');
is(GetLanguages('Die Katze tritt die Treppe und die Stiege krumm.'), 'de', 'enough German words');
is(GetLanguages('Le chat fait la même chose et ne chante pas.'), 'fr', 'enough French words');
is(GetLanguages('Die Katze tritt die Treppe und die Stiege krumm. '
		. 'Le chat fait la même chose et ne chante pas.'), 'de,fr', 'both German and French');
