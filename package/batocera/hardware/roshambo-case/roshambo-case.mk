################################################################################
#
# roshambo-case
#
################################################################################
# Version: Commits on Apr 30, 2022
ROSHAMBO_CASE_VERSION = 986a7db7a6ffcbd3a78e65f1669cfe7dd81e9fa7
ROSHAMBO_CASE_SITE = $(call github,mrfixit2001,Rock64-R64.GPIO,$(ROSHAMBO_CASE_VERSION))
ROSHAMBO_CASE_LICENSE = GPL-3.0+, others
ROSHAMBO_CASE_DEPENDENCIES = python3 host-python3

define ROSHAMBO_CASE_BUILD_CMDS
	(cd $(@D) && $(HOST_DIR)/bin/python -m compileall R64)

	# Ensure build directory is used instead of the read-only package directory
	mkdir -p $(@D)/roshambo-build
	cp $(ROSHAMBO_CASE_PKGDIR)/roshambo-case.py $(@D)/roshambo-build/

	# Run compilation inside the build directory
	(cd $(@D)/roshambo-build && $(HOST_DIR)/bin/python -m compileall roshambo-case.py)
endef

define ROSHAMBO_CASE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/R64
	cp -r $(@D)/R64/* $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/R64

	$(INSTALL) -D -m 0755 $(ROSHAMBO_CASE_PKGDIR)/S14roshambo $(TARGET_DIR)/etc/init.d/S14roshambo
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/bin $(@D)/roshambo-build/roshambo-case.py*
endef

$(eval $(generic-package))
