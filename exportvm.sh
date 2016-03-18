#!/bin/bash
cd ./tmp
rm *.ova
VM="Intermodal-0.4-TMP"
OVA="Intermodal-0.4.ova"
VBoxManage controlvm $VM poweroff
VBoxManage export $VM -o $OVA --vsys 0 --product Intermodal
VBoxManage unregistervm $VM --delete