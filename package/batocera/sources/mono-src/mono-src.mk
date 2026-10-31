################################################################################
#
# mono-src
#
################################################################################

MONO_SRC_VERSION = 6.14.1
MONO_SRC_SITE = https://dl.winehq.org/mono/sources/mono
MONO_SRC_SOURCE = mono-$(MONO_SRC_VERSION).tar.xz
MONO_SRC_SELINUX_MODULES = mono
MONO_SRC_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
MONO_SRC_LICENSE_FILES = LICENSE mcs/COPYING \
	external/Newtonsoft.Json/Tools/7-zip/copying.txt
MONO_SRC_CPE_ID_VENDOR = mono-project
MONO_SRC_INSTALL_STAGING = NO
MONO_SRC_INSTALL_TARGET_OPTS = DESTDIR=/tmp/mono install

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
    MONO_SRC_EXTRA_ARGS += PLATFORM=x86
    MONO_SRC_CROSS_ARCH = x86_64
else ifeq ($(BR2_aarch64),y)
    MONO_SRC_EXTRA_ARGS += PLATFORM=arm64
    MONO_SRC_CROSS_ARCH = arm64
endif

define MONO_SRC_INSTALL_TARGET_CMDS
    rm -rf /tmp/mono
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr STRIP=/bin/true DESTDIR=/tmp/mono install
    rm -rf /tmp/mono/usr/include
    rm -rf /tmp/mono/usr/lib/pkgconfig
    rm -rf /tmp/mono/usr/share/{locale,man}
    find /tmp/mono/ -type f -name "*.a" -exec rm {} \;
    find /tmp/mono/ -type f -name "*.la" -exec rm {} \;
    cp -a $(HOST_DIR)/lib/mono/{4.0,4.5,gac} /tmp/mono/usr/lib/mono
    cd /tmp/mono && tar -C . --owner=0 --group=0 --numeric-owner -cf - . | xz -7 -v > /mnt/smb/mono-$(MONO_SRC_CROSS_ARCH)-$(MONO_SRC_VERSION).tar.xz
    #rm -rf /tmp/mono
endef


$(eval $(autotools-package))
$(eval $(host-autotools-package))
