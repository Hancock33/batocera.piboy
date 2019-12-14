################################################################################
#
# polkit
#
################################################################################

POLKIT_VERSION = 0.116
POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
POLKIT_LICENSE = GPL-2.0
POLKIT_LICENSE_FILES = COPYING

POLKIT_INSTALL_STAGING = YES

POLKIT_DEPENDENCIES = libglib2 host-intltool expat spidermonkey

# spidermonkey needs C++11
POLKIT_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"

POLKIT_CONF_OPTS = \
	--with-os-type=unknown \
	--disable-man-pages \
	--disable-examples \
	--disable-libelogind \
	--disable-libsystemd-login

ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
POLKIT_CONF_OPTS += --with-authfw=pam
else
POLKIT_CONF_OPTS += --with-authfw=shadow
endif

$(eval $(autotools-package))
