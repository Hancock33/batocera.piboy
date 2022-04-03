################################################################################
#
# jdk-rpi4
#
################################################################################
JDK_RPI4_SOURCE = openjdk-$(JDK_RPI4_VERSION)_aarch64_rpi4.tar.xz
JDK_RPI4_SITE = https://github.com/Hancock33/openjdk-batocera/releases/download/$(JDK_RPI4_TAG)
JDK_RPI4_DEPENDENCIES = xlib_libXtst

ifeq ($(BR2_PACKAGE_BATOCERA_RPI4_WITH_XORG),y)
	JDK_RPI4_TAG = 34-dev-20220402
	JDK_RPI4_VERSION = 11.0.13+8
else
	JDK_RPI4_TAG = 32-dev
	JDK_RPI4_VERSION = 16.0.1+9
endif

define JDK_RPI4_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(JDK_RPI4_DL_SUBDIR)/$(JDK_RPI4_SOURCE)
endef

define JDK_RPI4_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
