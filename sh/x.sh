#!/bin/bash
# Create By NueXini

CONFIG_VERSION_NUMBER_NX=$(cat feeds/x/rom/lede/config.x86_64 | grep  'CONFIG_VERSION_NUMBER' | cut -d '"' -f 2)
sed -i "s/CONFIG_VERSION_NUMBER=\".*\"/CONFIG_VERSION_NUMBER=\"$CONFIG_VERSION_NUMBER_NX\"/" ./.config

cp -f $GITHUB_WORKSPACE/sh/x.banner package/base-files/files/etc/banner

sed -i 's,192.168.15,192.168.3,g' feeds/x/natflow/files/natflow.config

sed -i 's#/bootstrap#/argon#g' feeds/x/base-config-setting/files/uci.defaults

#sed -i '/admin\/initsetup/d' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's?fs.access(\"/etc/config/wizard\") and ??g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's,admin/initsetup,admin/status/overview,g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua

sed -i 's/-hidden//g' feeds/luci/applications/luci-app-opkg/root/usr/share/luci/menu.d/luci-app-opkg.json
sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-system/root/usr/share/luci/menu.d/luci-mod-system.json
sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json

sed -i "s#luci.main.lang='auto'#luci.main.lang='zh_cn'#g" feeds/x/base-config-setting/files/uci.defaults

# sed -i "s#anon_mount='0'#anon_mount='1'#g" feeds/x/base-config-setting/files/uci.defaults

sed -i "s#PasswordAuth='off'#PasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults
sed -i "s#RootPasswordAuth='off'#RootPasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults


sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults
cat $GITHUB_WORKSPACE/sh/uci.defaults | while read line
do
    echo $line >> feeds/x/base-config-setting/files/uci.defaults
done

cd feeds/NueXini_Packages
#curl -s https://raw.githubusercontent.com/NueXini/BuildOpenWrt/master/sh/language_fix.sh | /bin/bash
$GITHUB_WORKSPACE/sh/language_fix.sh

exit 0


