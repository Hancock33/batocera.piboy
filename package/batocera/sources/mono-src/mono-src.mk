################################################################################
#
# mono-src
#
################################################################################
# Version: Commits on Apr 29, 2025
MONO_SRC_VERSION = 6.14.1
MONO_SRC_SITE = https://dl.winehq.org/mono/sources/mono
MONO_SRC_SOURCE = mono-$(MONO_SRC_VERSION).tar.xz
MONO_SRC_SELINUX_MODULES = mono
MONO_SRC_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
MONO_SRC_LICENSE_FILES = LICENSE mcs/COPYING \
	external/Newtonsoft.Json/Tools/7-zip/copying.txt
MONO_SRC_CPE_ID_VENDOR = mono-project

# patching configure.ac
MONO_SRC_AUTORECONF = YES

MONO_SRC_COMMON_CONF_OPTS = --with-mcs-docs=no \
	--with-ikvm-native=no \
	--enable-minimal=profiler,debug \
	--enable-static \
	--disable-btls \
	--disable-system-aot

# Disable managed code (mcs folder) from building
MONO_SRC_CONF_OPTS = $(MONO_SRC_COMMON_CONF_OPTS) --disable-mcs-build

ifeq ($(BR2_PACKAGE_LIBICONV),y)
MONO_SRC_DEPENDENCIES += libiconv
endif

MONO_SRC_DEPENDENCIES += \
	host-mono-src \
	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
	libatomic_ops

## Mono managed

HOST_MONO_SRC_CONF_OPTS = $(MONO_SRC_COMMON_CONF_OPTS) --disable-libraries

# ensure monolite is used
HOST_MONO_SRC_MAKE_OPTS += EXTERNAL_MCS=false

HOST_MONO_SRC_DEPENDENCIES = host-monolite host-gettext host-python3

define HOST_MONO_SRC_SETUP_MONOLITE
	rm -rf $(@D)/mcs/class/lib/monolite
	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/lib/monolite monolite)
endef

HOST_MONO_SRC_POST_CONFIGURE_HOOKS += HOST_MONO_SRC_SETUP_MONOLITE

# build package
MONO_SRC_CROSS_ARCH = unknown

ifeq ($(BR2_x86_64),y)
    MONO_SRC_CROSS_ARCH = x86_64
else ifeq ($(BR2_aarch64),y)
    MONO_SRC_CROSS_ARCH = arm64
endif

# Release tarball, staged inside the build dir rather than /tmp
MONO_SRC_DIST_DIR = $(@D)/batocera-dist
MONO_SRC_TARBALL = mono-$(MONO_SRC_CROSS_ARCH)-$(MONO_SRC_VERSION).tar.xz

define MONO_SRC_INSTALL_TARGET_CMDS
	rm -rf $(MONO_SRC_DIST_DIR)
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr STRIP=/bin/true DESTDIR=$(MONO_SRC_DIST_DIR) install

	# Drop development files
	rm -rf $(MONO_SRC_DIST_DIR)/usr/include
	rm -rf $(MONO_SRC_DIST_DIR)/usr/lib/pkgconfig
	rm -rf $(MONO_SRC_DIST_DIR)/usr/share/{locale,man}
	find $(MONO_SRC_DIST_DIR) -type f \( -name "*.a" -o -name "*.la" \) -delete

	# Managed class libraries come from host-mono-src
	cp -a $(HOST_DIR)/lib/mono/{4.0,4.5,gac} $(MONO_SRC_DIST_DIR)/usr/lib/mono

	# Pack (root-owned, streamed straight into xz) and publish
	set -o pipefail; \
	tar -C $(MONO_SRC_DIST_DIR) --owner=0 --group=0 --numeric-owner -cf - . | \
		xz -T0 -7 -v > $(@D)/$(MONO_SRC_TARBALL)
	mv $(@D)/$(MONO_SRC_TARBALL) /mnt/smb/
	rm -rf $(MONO_SRC_DIST_DIR)
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
