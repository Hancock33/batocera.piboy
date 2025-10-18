################################################################################
#
# cabextract
#
################################################################################

CABEXTRACT_VERSION = 1.11
CABEXTRACT_SOURCE = cabextract-$(CABEXTRACT_VERSION).tar.gz
CABEXTRACT_SITE = https://www.cabextract.org.uk
CABEXTRACT_DEPENDENCIES = libmspack

CABEXTRACT_CONF_OPTS = --with-external-libmspack

$(eval $(autotools-package))
$(eval $(host-autotools-package))
