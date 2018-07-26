# libreelec-docker-xbmc-video-server

XBMC Video Server for LibreELEC using Docker and systemd

## Requirements

* LibreELEC with the Docker addon installed

## Installation

### Building the image

* Download this repository as a ZIP file using 
`wget https://github.com/Jalle19/libreelec-docker-xbmc-video-server/archive/master.zip -O libreelec-docker-xbmc-video-server.zip`
* Unzip the contents using `unzip libreelec-docker-xbmc-video-server.zip`, then run `cd libreelec-docker-xbmc-video-server-master`
* Build the Docker image using `./build.sh` (this will take about 5-10 minutes on your average Intel 
Celeron)
* Verify that the image got built by running `docker images | grep jalle19/libreelec-xbmc-video-server`. You should see one 
tagged version and one "latest".

### Enabling the service

* Run `systemctl enable /storage/libreelec-docker-xbmc-video-server-master/xbmc-video-server/xbmc-video-server.service` 
to enable the service. If you make changes to this file later on you must also run `systemctl daemon-reload` for the 
changes to take effect.
* Reboot or run `systemctl start xbmc-video-server` to start the service

## Change log

See [CHANGELOG.md](CHANGELOG.md)

## License

GNU General Public License 2.0
