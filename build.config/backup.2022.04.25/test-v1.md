部署编译环境: env.md/{lede & extra-apps.sh env}

进行如下操作：基于min-v2.config
```
> Kernel modules > USB Support
    <*> kmod-usb-serial-ch341
```

支持usb摄像头内核和luci
```
> Kernel modules > I2C support
    <*> kmod-i2c-core
> Kernel modules > USB Support
    -*- kmod-usb-core
> Kernel modules > Video Support
    <*> kmod-video-core
    <*> kmod-video-uvc
    <*> kmod-video-videobuf2
> depends依赖已选择：
    CONFIG_PACKAGE_kmod-input-core=y
    CONFIG_PACKAGE_kmod-mii=y
    CONFIG_PACKAGE_kmod-dma-buf=y
    CONFIG_PACKAGE_kmod-usb-net=y
    CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
    CONFIG_PACKAGE_kmod-usb-net-rndis=y
    CONFIG_PACKAGE_libeudev=y
    CONFIG_PACKAGE_libusb-1.0=y
    CONFIG_PACKAGE_usbids=y
    CONFIG_PACKAGE_usbutils=y
> LuCI > Applications
    <*> luci-app-mjpg-streamer                             [14kb](未测试，暂不使用)(兼容Linux-UVC的摄像头程序)
> depends依赖已选择：
    CONFIG_PACKAGE_libjpeg-turbo=y
    CONFIG_PACKAGE_mjpg-streamer=y
    # CONFIG_PACKAGE_mjpg-streamer-input-file is not set
    # CONFIG_PACKAGE_mjpg-streamer-input-http is not set
    # CONFIG_PACKAGE_mjpg-streamer-input-uvc is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-file is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-http is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-rtsp is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-zmq is not set
    # CONFIG_PACKAGE_mjpg-streamer-www is not set
    # CONFIG_PACKAGE_mjpg-streamer-www-simple is not set
```