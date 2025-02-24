export ARCHS = arm64 arm64e

export DEBUG = 1
export FINALPACKAGE = 0

export PREFIX = $(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/

TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AirKeeper

$(BUNDLE_NAME)_FILES = $(wildcard *.m) $(wildcard *.mm)
$(BUNDLE_NAME)_FRAMEWORKS = UIKit CoreGraphics NetworkExtension Security
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = Preferences CoreTelephony MobileCoreServices
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS = AltList
$(BUNDLE_NAME)_INSTALL_PATH = /Library/PreferenceBundles
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += akp
SUBPROJECTS += akpd
include $(THEOS_MAKE_PATH)/aggregate.mk
