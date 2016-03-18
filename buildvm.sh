#!/bin/bash
cd ./tmp
rm *.vdi
rm *.iso

VM="Intermodal-0.4-TMP"

#DL boot2docker iso
wget https://github.com/boot2docker/boot2docker/releases/download/v1.9.1/boot2docker.iso

# convert boot2docker iso to hdd format
VBoxManage convertfromraw --format VDI --variant Standard boot2docker.iso boot2docker.vdi

# create data disk
VBoxManage createmedium disk --filename data.vdi --variant Standard --size 100000 --format VDI

# create vm
VBoxManage createvm --register --name $VM

# modfy vm
VBoxManage modifyvm $VM \
 --ostype Linux_64 \
 --memory 4096 \
 --cpus 4 \
 --nic1 nat \
 --nictype1 virtio \
 --natpf1 docker,tcp,,2375,,2375 \
 --natpf1 ssh,tcp,,2222,,22 \
 --natpf1 sync,tcp,,2873,,2873 \
 --audio none \
 --ioapic on

# attach storage
VBoxManage storagectl $VM \
  --name "SATA Controller" \
  --add sata --controller IntelAHCI \
  --portcount 2 \
  --hostiocache on
VBoxManage storageattach $VM \
  --storagectl "SATA Controller" --port 0 \
  --device 0 --type hdd --medium boot2docker.vdi
VBoxManage storageattach $VM \
  --storagectl "SATA Controller" --port 1 \
  --device 0 --type hdd --medium data.vdi

# start vm
VBoxManage startvm $vm --type headless

cd ..