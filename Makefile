ARCHS = arm64
TARGET := iphone:clang:latest:14.0

DEBUG = 0

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dkhelper

$(TWEAK_NAME)_FILES = $(wildcard DK/*.xm) $(wildcard DK/*.m)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk