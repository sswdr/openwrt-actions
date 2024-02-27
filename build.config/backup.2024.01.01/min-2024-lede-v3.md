基于backup.2024.01.01/min-2024-lede-v2.config

添加如下：
```
> Kernel modules > Wireless Drivers
<*> kmod-brcmfmac............... Broadcom IEEE802.11n USB FullMAC
[*]   Enable SDIO bus interface support
[*]   Enable USB bus interface support
[*]   Enable PCIE bus interface support
<*> kmod-brcmutil
<*> kmod-cfg80211
<*> kmod-mac80211 
```
