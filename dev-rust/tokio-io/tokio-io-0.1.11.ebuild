# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core I/O primitives for async I/O in Rust"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/bytes-0.4*:= >=dev-rust/bytes-0.4.7 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.18 )
	=dev-rust/log-0.4*:=
	test? (
		( =dev-rust/tokio-current-thread-0.1*:= >=dev-rust/tokio-current-thread-0.1.1 )
	)
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
