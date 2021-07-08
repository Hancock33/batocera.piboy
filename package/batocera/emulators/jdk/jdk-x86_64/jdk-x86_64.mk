################################################################################
#
# jdk-x86_64
#
################################################################################
JDK_X86_64_VERSION = 16.0.1+9
JDK_X86_64_SOURCE = openjdk-$(JDK_X86_64_VERSION)_x86_64.tar.xz

JDK_X86_64_SITE = https://github.com/Hancock33/openjdk-batocera/releases/download/32-dev/$(JDK_X86_64_SOURCE)

define JDK_X86_64_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(JDK_X86_64_DL_SUBDIR)/$(JDK_X86_64_SOURCE)
endef

define JDK_X86_64_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
