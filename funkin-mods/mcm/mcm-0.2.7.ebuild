# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# MCM requires Psych Engine's dependencies.
# Refer to Psych Engine's compilation instructions.
EAPI=8

DESCRIPTION="FNF mod based on Red Mist and surrounding media"

HOMEPAGE="https://github.com/pahaze/Mistful-Crimson-Morning"

SRC_URI="https://github.com/MagelessMayhem/mcm-gentoo/archive/refs/tags/v0.2.7.tar.gz"

S="${WORKDIR}/mcm-gentoo-0.2.7"

LICENSE="Apache-2.0"

SLOT="0"

KEYWORDS="~amd64"

RDEPEND="
	media-sound/pulseaudio
	x11-libs/libX11
	=dev-lang/haxe-9999
"
DEPEND="${RDEPEND}"

src_compile() {
	haxelib setup /var/tmp/portage/.local/share/haxe/lib
	cd ${S}
	haxelib run lime build linux -verbose
}
src_install() {
	keepdir "/usr/share/games/MCM-V1"
	insinto "/usr/share/games/MCM-V1"
	doins -r "export/release/linux/bin"
}
pkg_postinst() {
	elog "You can find the mod under /usr/share/games."
}
