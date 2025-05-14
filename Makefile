#
#  dkhelper
#
#  Copyright (c) 2024 huami. All rights reserved.
#  Channel: @dkhelper
#  Created on: 2024/10/04
#
TARGET = iphone:clang:latest:15.0
ARCHS = arm64

#export THEOS=/Users/huami/theos
#export THEOS_PACKAGE_SCHEME=roothide

ifeq ($(SCHEME),roothide)
    export THEOS_PACKAGE_SCHEME = roothide
else ifeq ($(SCHEME),rootless)
    export THEOS_PACKAGE_SCHEME = rootless
endif

export DEBUG = 0
INSTALL_TARGET_PROCESSES = Aweme

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dkhelper

DYYY_FILES = $(wildcard DK/*.xm) $(wildcard DK/*.m)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -w
CXXFLAGS += -std=c++11
CCFLAGS += -std=c++11
$(TWEAK_NAME)_LOGOS_DEFAULT_GENERATOR = internal

export THEOS_STRICT_LOGOS=0
export ERROR_ON_WARNINGS=0
export LOGOS_DEFAULT_GENERATOR=internal

include $(THEOS_MAKE_PATH)/tweak.mk