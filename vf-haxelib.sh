#!/bin/bash
# Execute as sudo/root, otherwise this will not work
# Make sure to execute vf-conf.sh after this to create the portage directory
currentid=$(id -u)
if [ "$currentid" != 0 ]; then
  echo "Please run this script as root/sudo."
  exit 1
fi
echo "Assuming NekoVM has control of /usr/bin/haxelib. I will move the correct haxelib (/usr/local/bin/haxelib) to /usr/bin."
sleep 1
rm -v /usr/bin/haxelib
sleep 1
ln -sv /usr/local/bin/haxelib /usr/bin/haxelib
sleep 1
echo "Now I'll tell haxelib to install the proper libraries for you."
sleep 1
haxelib setup /usr/share/haxe/lib
haxelib install newgrounds 1.1.5
haxelib install lime
haxelib install flixel
haxelib install flixel-ui
haxelib install hscript
haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons
haxelib git polymod https://github.com/larsiusprime/polymod.git
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib git hxCodec https://github.com/MagelessMayhem/hxCodec
haxelib install flxanimate 1.2.0
haxelib install openfl
haxelib install actuate
haxelib run lime setup flixel
haxelib install flixel-tools
haxelib run flixel-tools setup
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git
haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git extension-webm https://github.com/KadeDev/extension-webm
haxelib run lime rebuild extension-webm linux
haxelib git tentools https://github.com/TentaRJ/tentools
haxelib run lime rebuild tentools linux
haxelib git systools https://github.com/waneck/systools
haxelib run lime rebuild systools linux
haxelib install hxp
echo "Now copying libidn. This is necessary for Wednesday's Infidelity (funkin-mods/wi) to build."
sleep 1
cp -v /usr/share/haxe/lib/hxcodec/2,5,1/lib/vlc/lib/Linux/libidn.so.11 /usr/lib64
sleep 1
echo "If any ebuild fails due to a polymod error, try an earlier version of polymod. Other than that, we're finished. I'll quit out of here."
