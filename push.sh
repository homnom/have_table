#!/bin/bash

version=`cat have_table.gemspec | grep 'version' | awk -F '\"' '{ print $2; }'`

gem push "have_table-${version}.gem"