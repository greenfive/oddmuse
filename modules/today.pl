# Copyright (C) 2006  Alex Schroeder <alex@emacswiki.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
#    Free Software Foundation, Inc.
#    59 Temple Place, Suite 330
#    Boston, MA 02111-1307 USA

$ModulesDescription .= '<p>$Id: today.pl,v 1.3 2006/02/22 22:28:42 as Exp $</p>';

# New Action

$Action{new} = \&DoNew;

sub DoNew {
  my $id = shift;
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = gmtime($Now);
  $today = sprintf("%d-%02d-%02d", $year + 1900, $mon + 1, $mday);
  $today .= "_" . $id if $id;
  return DoEdit($today);
}