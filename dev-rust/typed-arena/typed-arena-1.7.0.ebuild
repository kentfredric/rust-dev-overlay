# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="THe arena, a fast but limited type of allocator"
HOMEPAGE="https://github.com/SimonSapin/rust-typed-arena"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	rm -vrf ci/ || die
	default
}
