TERMUX_PKG_HOMEPAGE=https://newsboat.org/
TERMUX_PKG_DESCRIPTION="RSS/Atom feed reader for the text console"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=2.20.1
TERMUX_PKG_SRCURL=https://newsboat.org/releases/${TERMUX_PKG_VERSION}/newsboat-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=82782079b75fe307f7a5a17dff9e712aa5975678fa550fb728d5a46867943566
TERMUX_PKG_DEPENDS="libc++, libiconv, libandroid-support, libandroid-glob, json-c, libsqlite, libcurl, libxml2, stfl, ncurses, openssl"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_RM_AFTER_INSTALL="share/locale"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_lib_bsd_main=no"
TERMUX_PKG_CONFLICTS=newsbeuter
TERMUX_PKG_REPLACES=newsbeuter

termux_step_pre_configure() {
	termux_setup_rust

	export CXX_FOR_BUILD=g++
	export CXXFLAGS_FOR_BUILD="-O2"

	# Used by newsboat Makefile:
	export CARGO_BUILD_TARGET=$CARGO_TARGET_NAME

	LDFLAGS+=" -liconv"

	export PKG_CONFIG_ALLOW_CROSS=1
}
