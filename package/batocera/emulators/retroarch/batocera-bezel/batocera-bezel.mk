################################################################################
#
# batocera-bezel
#
################################################################################
# Version: Commits on Sept 10, 2024
BATOCERA_BEZEL_VERSION = f981ce209f4c76ba70113e24371a5b3aec5440d8
BATOCERA_BEZEL_SITE = $(call github,hancock33,batocera-bezel,$(BATOCERA_BEZEL_VERSION))

define BATOCERA_BEZEL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/ambiance_broadcast			$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/ambiance_gameroom			$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/ambiance_monitor_1084s		$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/ambiance_night				$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/ambiance_vintage_tv		$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/arcade_1980s				$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	cp -rf $(@D)/arcade_1980s_vertical		$(TARGET_DIR)/usr/share/batocera/datainit/decorations
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/decorations/consoles
	# we don't have all systems with no_curve_night yet, so we copy first the "classic" bezels
	cp -rf --remove-destination $(@D)/default_unglazed/*				$(TARGET_DIR)/usr/share/batocera/datainit/decorations/consoles/
	cp -rf --remove-destination $(@D)/default_nocurve_night/default.* 	$(TARGET_DIR)/usr/share/batocera/datainit/decorations/consoles/
	cp -rf --remove-destination $(@D)/default_nocurve_night/systems		$(TARGET_DIR)/usr/share/batocera/datainit/decorations/consoles/
	cp -rf --remove-destination $(@D)/default_standalone_night/systems	$(TARGET_DIR)/usr/share/batocera/datainit/decorations/consoles/
	(cd $(TARGET_DIR)/usr/share/batocera/datainit/decorations && ln -sf consoles default)

	echo -e "You can find help on how to customize decorations: \n" \
		> $(TARGET_DIR)/usr/share/batocera/datainit/decorations/readme.txt
	echo "https://wiki.batocera.org/decoration#decoration_bezels_customization" \
		>> $(TARGET_DIR)/usr/share/batocera/datainit/decorations/readme.txt
	echo "You can put standalone bezels here too." \
		>> $(TARGET_DIR)/usr/share/batocera/datainit/decorations/readme.txt

endef

$(eval $(generic-package))
