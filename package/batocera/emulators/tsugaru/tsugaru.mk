################################################################################
#
# tsugaru
#
################################################################################
# Version: Commits on Jul 13, 2023
TSUGARU_VERSION = 929a95e111ebe4acd3f501609eca1d5682aa8039
TSUGARU_SITE = $(call github,captainys,TOWNSEMU,$(TSUGARU_VERSION))
TSUGARU_DEPENDENCIES = libglu host-ninja
TSUGARU_LICENSE = GPLv2
TSUGARU_SUPPORTS_IN_SOURCE_BUILD = NO
# CMakeLists.txt in src subfolder
TSUGARU_SUBDIR = src

TSUGARU_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=FALSE -GNinja
TSUGARU_CONF_ENV += LDFLAGS=-lpthread

define TSUGARU_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(TSUGARU_BUILDDIR)
endef

define TSUGARU_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/usr/bin
        $(INSTALL) -D $(@D)/src/buildroot-build/main_cui/Tsugaru_CUI \
                $(TARGET_DIR)/usr/bin/

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/tsugaru/fmtowns.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
