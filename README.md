# brokkr

Config and setup files for the LDO Voron 2.4. The printer is a single toolhead until the PPS-CF toolheads are built.

## What is live

`config/` is the set copied to `~/printer_data/config/` on the Pi.

- Leviathan v1.2 and the Nitehawk-SB
- One extruder, bed, and chamber heater
- KlipperScreen on the BigTreeTech Pi TFT43, rotated 180 degrees by `pi/90-dsi-rotate.conf`

`scripts/bootstrap-pi.sh` repeats that setup on a fresh Mainsail card. Flash Mainsail OS first, boot the Pi, copy this repo over, and run the script as the Mainsail user.

## What is stored for later

`archive/toolchanger/` is the previous toolchanger config, including the Birds' Nest include. Do not copy it onto the Pi until the new tools exist. It needs [klipper-toolchanger](https://github.com/viesturz/klipper-toolchanger) and [tapchanger](https://github.com/viesturz/tapchanger).

## Ansible

Ansible is a reasonable way to run the Pi rebuild, and a poor place to keep the printer config. The files in `config/` and `pi/` are the source of truth. A playbook would only copy those files and install KlipperScreen. That is one host and a short script, so the bootstrap stays a shell script until a second machine needs the same setup.
