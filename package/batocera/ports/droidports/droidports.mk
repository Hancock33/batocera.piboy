################################################################################
#
# Droid Ports
#
################################################################################
# Version.: Commits on Nov 27, 2021
DROIDPORTS_VERSION = faf39702a6148f689c3f36964c8eabad81dc996b
DROIDPORTS_SITE = https://github.com/JohnnyonFlame/droidports.git
DROIDPORTS_SITE_METHOD=git
DROIDPORTS_GIT_SUBMODULES=YES

DROIDPORTS_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
DROIDPORTS_LICENSE = GPL-2.0

DROIDPORTS_SUPPORTS_IN_SOURCE_BUILD = NO

DROIDPORTS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release 
DROIDPORTS_CONF_OPTS += -DPLATFORM=linux
DROIDPORTS_CONF_OPTS += -DPORT=gmloader
DROIDPORTS_CONF_OPTS += -DCMAKE_CXX_FLAGS="-w -mlittle-endian -fsingle-precision-constant -Wdouble-promotion -Wfloat-conversion -lm"
DROIDPORTS_CONF_OPTS += -DCMAKE_C_FLAGS="-w -mlittle-endian -fsingle-precision-constant -Wdouble-promotion -Wfloat-conversion -lm"

define DROIDPORTS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/DROIDPORTS
	cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/DROIDPORTS/
	$(INSTALL) -D $(@D)/buildroot-build/DROIDPORTS $(TARGET_DIR)/usr/share/DROIDPORTS/DROIDPORTS
	chmod 0754 $(TARGET_DIR)/usr/share/DROIDPORTS/DROIDPORTS
	echo "cd /usr/share/DROIDPORTS && ./DROIDPORTS" > $(TARGET_DIR)/usr/share/DROIDPORTS/DROIDPORTS.sh
	chmod 0754 $(TARGET_DIR)/usr/share/DROIDPORTS/DROIDPORTS.sh

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/DROIDPORTS/DROIDPORTS.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
