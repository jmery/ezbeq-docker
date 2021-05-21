CONTAINER_NAME = name of your container (e.g., `jmery/ezbeq`)

Run within same directory as Dockerfile to build the container:

```docker build -t CONTAINER_NAME .```

We need to find the path to the miniDSP so we can expose it to the running container when the container is launched.  These commands may vary based on your host OS.  Using Ubuntu as an example:

1. Run `lsusb`
2. Look for the miniDSP device
3. Note the Bus and Device numbers

In the example below, the Bus number is '001' and the Device number is '003'.

```
jmery@ubuntu:~/src/ezbeq$ lsusb
Bus 001 Device 003: ID 2752:0011 miniDSP miniDSP 2x4HD
Bus 001 Device 002: ID 0e0f:000b VMware, Inc. VMware Virtual USB Video Device
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 004: ID 0e0f:0008 VMware, Inc. Virtual Bluetooth Adapter
Bus 002 Device 003: ID 0e0f:0002 VMware, Inc. Virtual USB Hub
Bus 002 Device 002: ID 0e0f:0003 VMware, Inc. Virtual Mouse
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
jmery@ubuntu:~/src/ezbeq$ 
```

Run to lauch the container.  Replace BUS_NUMBER, DEVICE_NUMBER, and CONTAINER_NAME with your unique values used or found above.

```docker run -it --device=/dev/bus/usb/BUS_NUMBER/DEVICE_NUMBER -p 8080:8080 CONTAINER_NAME```
