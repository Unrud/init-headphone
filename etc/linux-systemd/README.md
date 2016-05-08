This directory contains a configuration for **systemd** to run the script
on boot and after suspend and hibernation.

Copy the file `init-headphone.service` to `/etc/systemd/system` and run
`systemctl enable init-headphone`.