################################################################################
#
# cabextract
#
################################################################################
# Version: Commits on Feb 24, 2023
CABEXTRACT_VERSION = 1.9.1
CABEXTRACT_SITE = https://www.cabextract.org.uk

CABEXTRACT_CONF_OPTS = --with-external-libmspack

$(eval $(autotools-package))
$(eval $(host-autotools-package))
