sudo apt udpate
sudo apt upgrade
sudo apt dist-upgrade -y
sudo apt install realtek-rtl88xxau-dkms
sudo apt install dkms
git clone https://github.com/aircrack-ng/rtl8812au
cd rtl8812au/
make
sudo make install 
echo "solo falta reiniciar"
