# intermodal-vm
Run buildvm.sh from project root
in vm, fdisk and format /dev/sdb(1)
echo DOCKER_TLS=no >> /var/lib/boot2docker/profile
echo DOCKER_STORAGE=overlay >> /var/lib/boot2docker/profile
run exportvm.sh in project root_