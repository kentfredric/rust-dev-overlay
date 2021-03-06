# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A terminal formatting library"
HOMEPAGE="https://github.com/Stebalien/term"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	( =dev-rust/dirs-2*:= >=dev-rust/dirs-2.0.1 )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
