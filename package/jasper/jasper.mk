################################################################################
#
# jasper
#
################################################################################

JASPER_VERSION = version-2.0.13
JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
JASPER_INSTALL_STAGING = YES
JASPER_LICENSE = JasPer License Version 2.0
JASPER_LICENSE_FILES = LICENSE
JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
JASPER_CONF_OPTS = \
	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
	-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE

ifeq ($(BR2_STATIC_LIBS),y)
JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
JASPER_DEPENDENCIES += jpeg
else
JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=OFF
endif

$(eval $(cmake-package))
