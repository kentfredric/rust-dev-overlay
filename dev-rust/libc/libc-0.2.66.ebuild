# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Raw bindings to platform APIs for Rust"
HOMEPAGE="https://github.com/rust-lang/libc"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test rustc-dep-of-std"

F_RUSTC_STD_WORKSPACE_CORE="
	=dev-rust/rustc-std-workspace-core-1*:=
"
F_RUSTC_DEP_OF_STD="
	${F_RUSTC_STD_WORKSPACE_CORE}
"
BDEPEND="
	rustc-dep-of-std? ( ${F_RUSTC_DEP_OF_STD} )
	test? (
		${F_RUSTC_STD_WORKSPACE_CORE}
	)
"
