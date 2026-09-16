################################################################################
#
# batocera-launch-cgenius
#
################################################################################

BATOCERA_LAUNCH_CGENIUS_SETUP_TYPE=hatch
BATOCERA_LAUNCH_CGENIUS_DEPENDENCIES = \
	python-batocera-common \
	batocera-launch \
	python-configobj

$(eval $(local-python-package))
