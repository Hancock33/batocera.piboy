################################################################################
#
# jdk-rpi4
#
################################################################################
JDK_RPI4_VERSION = 16.0.1+9
JDK_RPI4_SOURCE = openjdk-$(JDK_RPI4_VERSION)_aarch64.tar.xz

JDK_RPI4_SITE = https://github.com/Hancock33/openjdk-batocera/releases/download/32-dev/$(JDK_RPI4_SOURCE)

define JDK_RPI4_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(JDK_RPI4_DL_SUBDIR)/$(JDK_RPI4_SOURCE)
endef

define JDK_RPI4_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
