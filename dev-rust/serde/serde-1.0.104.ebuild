# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Serialization framework for Rust"
HOMEPAGE="https://serde.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="derive test"

F_SERDE_DERIVE="
	~dev-rust/serde_derive-1.0.104:=
"
F_DERIVE="${F_SERDE_DERIVE}"
BDEPEND="
	derive? ( ${F_DERIVE} )
	test? ( ${F_DERIVE} )
"
