### Random
Microsoft edge installation in Centos
* Centos already has `flatpak` installed in its distribution by default `flatpak --help`, now you need to add flathub repository to your system in order to search and install `Edge`
* Download `flathub` from with this command `wget https://flathub.org/repo/flathub.flatpakrepo` and add it the system with this command `flatpak remote-add --user flathub https://flathub.org/repo/flathub.flatpakrepo`
* you can install Microsoft Edge from Flathub by running this command: `flatpak install flathub com.microsoft.Edge`
* This will download and install Microsoft Edge on your system. You can then run it by typing: `flatpak run com.microsoft.Edge`