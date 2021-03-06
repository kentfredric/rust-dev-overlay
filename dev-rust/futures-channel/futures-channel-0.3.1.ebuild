# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Channels for async communication using 'futures'"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="sink test"
F_SINK="
	( =dev-rust/futures-sink-0.3*:= >=dev-rust/futures-sink-0.3.1 )
"
BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.1 )
	sink? ( ${F_SINK} )
	test? ( ${F_SINK} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-test-circularity.patch"
)
src_test() {
	# Doctests broken by https://github.com/rust-lang/futures-rs/issues/1017
	ecargo test --tests
}
