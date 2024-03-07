#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# For the complete terms of the GNU General Public License, please see this URL:
# http://www.gnu.org/licenses/gpl-3.0.html
#
# Copyright (c) 2024, Peter Laszlo
#

plugin_version="2024.03.06"

tar czvf "autotweak-$plugin_version.tgz" -C ./source .  
new_md5=$(md5 -q "autotweak-$plugin_version.tgz")

sed -i '' "s/<!ENTITY md5[[:space:]]*\".*\">/<!ENTITY md5\t\t\"$new_md5\">/" autotweak.plg
sed -i '' "s/<!ENTITY version[[:space:]]*\".*\">/<!ENTITY version\t\"$plugin_version\">/" autotweak.plg




