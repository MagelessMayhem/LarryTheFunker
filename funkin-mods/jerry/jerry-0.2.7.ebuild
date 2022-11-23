# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# This mod is based on Psych Engine and requires Psych dependencies.
# You may view Psych's compilation instructions to fetch the proper dependencies.
EAPI=8

DESCRIPTION="FNF mod based on Jerry's Basement"

HOMEPAGE="https://github.com/JoseXD2/Jerry"

SRC_URI="https://github.com/MagelessMayhem/jerry/releases/download/v0.2.7-RELEASE/Violet-Jerry.tar.gz"

S="${WORKDIR}"

LICENSE="Apache-2.0"

SLOT="0"

KEYWORDS="~amd64"
IUSE="
	+X
	+alsa
	pulseaudio
"

RDEPEND="
	X? ( x11-base/xorg-server )
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
"

DEPEND="
	${RDEPEND}
"
src_install() {
	keepdir "/usr/share/games/FNF-Jerry"
	insinto "/usr/share/games/FNF-Jerry"
	doins -r "Violet-Jerry/bin"
}
pkg_postinst() {
	elog "You can find the mod in /usr/share/games."
	elog
	elog "You may also want to run this command to be able"
	elog "to run the mod:"
	elog
	elog "sudo chown -R <username> /usr/share/games/FNF-Jerry"
}
