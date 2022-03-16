
# Disable ipv6
# uci -q batch <<-EOF >/dev/null
#         /etc/init.d/odhcpd disable
#         uci set dhcp.@dnsmasq[0].filter_aaaa='1'
#         uci commit dhcp
# EOF

uci set natcapd.default.peer_sni_ban='1'
uci commit natcapd

sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-aria2.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-hd-idle.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-minidlna.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-p910nd.json
sed -i 's#admin/services#admin/network#g' /usr/share/luci/menu.d/luci-app-fakemesh.json

rm -f /www/luci-static/resources/view/status/include/50_dsl.js
rm -f /www/luci-static/resources/view/status/include/70_ddns.js
rm -f /www/luci-static/resources/view/status/include/80_minidlna.js
rm -f /www/luci-static/resources/view/status/include/80_upnp.js
rm -f /www/luci-static/resources/view/status/include/90_mwan3.js

ln -sf /sbin/ip /usr/bin/ip

sed -i '/log-facility/d' /etc/dnsmasq.conf
echo "log-facility=/dev/null" >> /etc/dnsmasq.conf

sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/openwrt#g' /etc/opkg/distfeeds.conf
sed -i '/NueXini_Packages/d' /etc/opkg/distfeeds.conf
sed -i "s/# //g" /etc/opkg/distfeeds.conf

sed -i '/option disabled/d' /etc/config/wireless
sed -i '/set wireless.radio${devidx}.disabled/d' /lib/wifi/mac80211.sh
wifi up

sed -i 's/-hidden//g' /usr/share/luci/menu.d/*.json

rm /etc/adv_luci_disabled
rm -rf /tmp/luci-modulecache/
rm -f /tmp/luci-indexcache

exit 0

