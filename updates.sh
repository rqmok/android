#!/bin/bash

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

android="${PWD}"

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(117733)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(123032)

# policy: Show a simple dialog about optimizing apps
cherries+=(131627)

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/build/tools/repopick.py -b -f ${cherries[@]}
fi
