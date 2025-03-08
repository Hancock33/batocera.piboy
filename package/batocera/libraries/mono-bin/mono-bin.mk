################################################################################
#
# mono-bin
#
################################################################################
# Version: Commits on Mar 08, 2025
MONO_BIN_VERSION = 6.14.0
MONO_BIN_SITE = https://github.com/Hancock33/batocera-mono/releases/download/$(MONO_BIN_VERSION)
MONO_BIN_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    MONO_BIN_CROSS_ARCH = x86_64
endif

ifeq ($(BR2_aarch64),y)
    MONO_BIN_CROSS_ARCH = arm64
endif

ifeq ($(BR2_arm),y)
    MONO_BIN_CROSS_ARCH = arm
endif

MONO_BIN_SOURCE = mono-$(MONO_BIN_CROSS_ARCH)-$(MONO_BIN_VERSION).tar.xz

define MONO_BIN_INSTALL_TARGET_CMDS
	tar -xf $(DL_DIR)/$(MONO_BIN_DL_SUBDIR)/$(MONO_BIN_SOURCE) -C $(TARGET_DIR)
endef

$(eval $(generic-package))
