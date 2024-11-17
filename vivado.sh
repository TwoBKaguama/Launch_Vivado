#!/bin/bash

# Configurar el entorno de Vivado
source /home/suisei/Documents/Vivado/2024.1/settings64.sh

# Instalar dependencias necesarias si no están presentes
echo "Instalando dependencias necesarias..."
sudo pacman -S --noconfirm ncurses libxcrypt

# Crear enlace simbólico para libcrypt.so.1 si no existe
if [ ! -f /usr/lib/libcrypt.so.1 ]; then
  echo "Creando enlace simbólico para libcrypt.so.1..."
  sudo ln -s /home/suisei/Documents/Vitis_HLS/2024.1/vcxx/third-party/python-linux/user/3.10.10/lib/libcrypt.so.1 /usr/lib/libcrypt.so.1
fi

# Crear enlace simbólico para libtinfo.so.5 si no existe
if [ ! -f /usr/lib/libtinfo.so.5 ]; then
  echo "Creando enlace simbólico para libtinfo.so.5..."
  sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5
fi

# Ejecutar Vivado
echo "Ejecutando Vivado..."
vivado
