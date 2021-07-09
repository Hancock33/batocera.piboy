################################################################################
#
# jdk-rpi3
#
################################################################################
JDK_RPI3_VERSION = 16.0.1+9
JDK_RPI3_SOURCE = openjdk-$(JDK_RPI3_VERSION)_aarch64_rpi3.tar.xz

JDK_RPI3_SITE = https://github.com/Hancock33/openjdk-batocera/releases/download/32-dev

define JDK_RPI3_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(JDK_RPI3_DL_SUBDIR)/$(JDK_RPI3_SOURCE)
endef

define JDK_RPI3_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
