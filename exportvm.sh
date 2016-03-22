#!/bin/bash
cd ./tmp
rm *.ova
VM="Intermodal-0.4.1"
OVA="Intermodal-0.4.1.ova"
VBoxManage controlvm $VM poweroff
VBoxManage export $VM -o $OVA --vsys 0 --product "Intermodal-0.4"
VBoxManage unregistervm $VM --delete