################################################################################
#
# sof
#
################################################################################
# Version: Commits on Feb 12, 2024
SOF_VERSION = v2.8.1
SOF_SITE = $(call github,thesofproject,sof,$(SOF_VERSION))
SOF_LICENSE = BSD-3-Clause
SOF_LICENSE_FILES = LICENSE

define SOF_BUILD_CMDS
	cp $(@D)/installer/sample-config.mk $(@D)/installer/config.mk
	make CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/installer -f GNUmakefile
endef

$(eval $(generic-package))
