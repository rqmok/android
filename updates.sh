#!/bin/bash

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

android="${PWD}"

# Implement UICC TLV Data decoding.
cherries+=(114381)

# Skip unknown tags instead of aborting when parsing UICC TLV data
cherries+=(114382)

# UiccController: add back registerForOn
cherries+=(114805)

# UiccController: use registerForAvailable only when persist.radio.apm_sim_not_pwdn is enabled
cherries+=(114806)

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(117733)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(123032)

# policy: Show a simple dialog about optimizing apps
cherries+=(131627)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
    ${android}/build/tools/repopick.py -b -f ${cherries[@]}
fi
