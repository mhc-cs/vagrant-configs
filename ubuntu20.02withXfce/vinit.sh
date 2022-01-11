#!/bin/bash

## put this script in same directory as Vagrantfile

myDir=$(dirname "$0")
cd $myDir 
vagrant up && vagrant halt && 

declare vmName=$( vboxmanage list vms | cut -f 2 -d " "  | sed 's/^.//' | sed 's/.$//' )

declare theSnapshots=$( /usr/local/bin/vboxmanage snapshot "$vmName" list )

if grep -q "This machine does not have any snapshots" <<< $theSnapshots ; then
	# VM is brand new so let's snapshot it
	/usr/local/bin/vboxmanage snapshot "$vmName" take clean-state --description="default state of the CS221 VM"
else
	# restore from existing clean-state snapshot
	/usr/local/bin/vboxmanage snapshot "$vmName" restore clean-state
fi
