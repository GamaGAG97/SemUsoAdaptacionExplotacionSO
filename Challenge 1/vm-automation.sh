#!/bin/bash

# Solicitar al usuario los valores
read -p "Nombre de la máquina virtual: " nombre_vm
read -p "Tipo de sistema operativo (Linux): " tipo_so
read -p "Número de CPUs: " numero_cpus
read -p "Tamaño de la RAM (GB): " tam_ram
read -p "Tamaño de la VRAM (MB): " tam_vram
read -p "Tamaño del disco duro virtual (GB): " disco_duro
read -p "Nombre del controlador SATA: " controlador_sata
read -p "Nombre del controlador IDE: " controlador_ide

# Creating a VM
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_so" --register

# Setting up a VM's Properties
VBoxManage modifyvm "$nombre_vm" --cpus "$numero_cpus" --memory "$((tam_ram * 1024))" --vram "$tam_vram"

# Attaching Virtual Media 
VBoxManage createhd --filename "$nombre_vm.vdi" --size "$((disco_duro * 1024))" --variant Standard
VBoxManage storagectl "$nombre_vm" --name "$controlador_sata" --add sata --bootable on
VBoxManage storageattach "$nombre_vm" --storagectl "$controlador_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Adding an IDE controller
VBoxManage storagectl "$nombre_vm" --name "$controlador_ide" --add ide

# SHowin info
echo "Configuración de la máquina virtual:"
VBoxManage showvminfo "$nombre_vm" | grep -E "Name|Memory size|VRAM size|#0|#1"
