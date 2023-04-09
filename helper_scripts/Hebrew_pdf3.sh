#!/usr/bin/env bash

# Copyright 2019, Kornel Benko

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This script is used to make compilation of Hebrew documents with
# dvipdfmx work.
#
# Compilation with dvipdfmx should work immediately after running this script.
# e.g., No need to restart or run texhash.
#
#
# It must be run in the helper_scripts directory
# (so as to find add_pfbfonts.pl script)

set -u
set -e

helper_d="$( pwd )"

TEX_MF_LOCAL="$( /opt/texbin/kpsewhich --var-value TEXMFLOCAL )"

(
  cd "${TEX_MF_LOCAL}/fonts/type1/public/culmus" &&
  for i in *.pfa; do
    echo "${i} -> ${i%.*}.pfb"
    /opt/texbin/t1binary "${i}" "${i%.*}.pfb"
  done
)

/opt/texbin/mktexlsr

sed -i 's/.pfa$/.pfb/g' "${TEX_MF_LOCAL}/fonts/map/dvips/culmus.map"

/opt/texbin/updmap-sys
