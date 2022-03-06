#!/bin/bash
# Create By NueXini
echo '#############################
1.Xioami Router 3G
2.Xioami Router 3
3.Other
#############################'

read -p "Input your device number: " num

R3G="luci-app-aliyundrive-webdav
luci-app-aria2
webui-aria2
luci-app-ksmbd
luci-app-minidlna
luci-app-mwan3helper
luci-app-nfs
luci-app-openclash
luci-app-p910nd
p910nd-helper
luci-app-passwall
luci-app-passwall_INCLUDE_ChinaDNS_NG
luci-app-passwall_INCLUDE_IPv6_Nat
luci-app-passwall_INCLUDE_PDNSD
luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client
luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server
luci-app-passwall_INCLUDE_Xray
luci-app-ssr-plus
luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Client
luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Server
luci-app-ssr-plus_INCLUDE_Xray
luci-app-usb-printer
kmod-usb-net-cdc-eem
kmod-usb-net-cdc-ether
kmod-usb-net-cdc-mbim
kmod-usb-net-cdc-ncm
kmod-usb-net-cdc-subset
kmod-usb-net-huawei-cdc-ncm
kmod-usb-net-ipheth
kmod-usb-net-qmi-wwan
kmod-usb-net-rndis
kmod-usb-net-sierrawireless
kmod-usb-serial-option
kmod-usb-serial-qualcomm
kmod-usb-serial-sierrawireless
kmod-usb-serial-wwan
kmod-usb-ohci
kmod-usb-storage
kmod-usb-storage-uas
kmod-usb3
luci-proto-3g
luci-proto-bonding
luci-proto-mbim
luci-proto-ncm
luci-proto-qmi
kmod-fs-autofs4
kmod-exfat-linux
kmod-fs-ext4
kmod-fs-msdos
block-mount
kmod-fs-ntfs3
"

R3="luci-app-aliyundrive-webdav
luci-app-aria2
webui-aria2
luci-app-ksmbd
luci-app-mwan3helper
luci-app-p910nd
p910nd-helper
luci-app-ssr-plus
luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Client
luci-app-ssr-plus_INCLUDE_Xray
luci-app-usb-printer
kmod-usb-net-cdc-eem
kmod-usb-net-cdc-ether
kmod-usb-net-cdc-mbim
kmod-usb-net-cdc-ncm
kmod-usb-net-cdc-subset
kmod-usb-net-huawei-cdc-ncm
kmod-usb-net-ipheth
kmod-usb-net-qmi-wwan
kmod-usb-net-rndis
kmod-usb-net-sierrawireless
kmod-usb-serial-option
kmod-usb-serial-qualcomm
kmod-usb-serial-sierrawireless
kmod-usb-serial-wwan
kmod-usb-ohci
kmod-usb-storage
kmod-usb-storage-uas
kmod-usb2
luci-proto-3g
luci-proto-bonding
luci-proto-mbim
luci-proto-ncm
luci-proto-qmi
kmod-fs-autofs4
kmod-exfat-linux
kmod-fs-ext4
kmod-fs-msdos
block-mount
kmod-fs-ntfs3
"

app="luci-app-accesscontrol
luci-app-argon-config
luci-app-arpbind
luci-app-autotimeset
luci-app-commands
luci-app-easymesh
luci-app-filetransfer
luci-app-guest-wifi
luci-app-nft-qos
luci-app-ramfree
luci-app-syncdial
luci-app-tcpdump
luci-app-tencentddns
luci-app-ttnode
luci-app-ttyd
luci-app-upnp
luci-app-vlmcsd
luci-app-wifischedule
luci-app-zerotier
luci-theme-argon-2102
ddns-scripts-cloudflare
ddns-scripts-dnspod
ddns-scripts_aliyun
dnsmasq_full_dhcpv6
dnsmasq_full_dnssec
dnsmasq_full_ipset
dnsmasq_full_tftp"

noneed="luci-app-sqm
luci-app-wizard"

case "$num" in
	1)
	apps=${R3G}${app}
	;;
	2)
	apps=${R3}${app}
	;;
	*)
	apps=${app}
esac

sed -i 's/=m/=n/g' .config

for i in $apps; do
	sed -i "/$i/d" .config
	echo 'CONFIG_PACKAGE_'$i'=y' >> .config
done

for n in $noneed; do
	sed -i "/$n/d" .config
	echo 'CONFIG_PACKAGE_'$n'=n' >> .config
done

echo '==[make menuconfig done]=='

exit 0

