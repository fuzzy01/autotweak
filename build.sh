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

plugin_version=${1:-"dev"}
echo "Building version: $plugin_version"

# Check the operating system
os_name=$(uname)

if [ "$os_name" = "Darwin" ]; then
    # macOS commands
    mkdir build
    tar czvf "build/autotweak-$plugin_version.tgz" -C ./source .
    new_md5=$(md5 -q "build/autotweak-$plugin_version.tgz")
    cp autotweak.plg build/autotweak.plg
    sed -i '' "s/<!ENTITY md5[[:space:]]*\".*\">/<!ENTITY md5\t\t\"$new_md5\">/" build/autotweak.plg
    sed -i '' "s/<!ENTITY version[[:space:]]*\".*\">/<!ENTITY version\t\"$plugin_version\">/" build/autotweak.plg
    ls -l build
elif [ "$os_name" = "Linux" ]; then
    # Linux commands
    mkdir build
    tar czvf "build/autotweak-$plugin_version.tgz" -C ./source .
    new_md5=$(md5sum "build/autotweak-$plugin_version.tgz" | cut -d ' ' -f 1)
    cp autotweak.plg build/autotweak.plg
    sed -i "s/<!ENTITY md5[[:space:]]*\".*\">/<!ENTITY md5\t\t\"$new_md5\">/" build/autotweak.plg
    sed -i "s/<!ENTITY version[[:space:]]*\".*\">/<!ENTITY version\t\"$plugin_version\">/" build/autotweak.plg
    ls -l build
else
    echo "Unsupported OS: $os_name"
fi