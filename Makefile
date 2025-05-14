export DEBUG=0
export FINALPACKAGE=1
#export THEOS=/Users/huami/theos

# make clean && make package SCHEME=rootless （原第5行，注释符号错误）

# 项目名称
TWEAK_NAME = Bubblefishwchat

# 根据 SCHEME 变量的值设置 Theos 包的方案和安装路径。
ifeq ($(SCHEME),roothide)
export THEOS_PACKAGE_SCHEME = roothide
else ifeq ($(SCHEME),rootless)
export THEOS_PACKAGE_SCHEME = rootless
else ifeq ($(SCHEME),rootful)
export THEOS_PACKAGE_SCHEME = rootful
endif

# 目标设备最低版本
export ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0

# 源文件
$(TWEAK_NAME)_FILES_FILES = $(wildcard DK/*.xm) \
                     $(wildcard DK/*.m) 

# 编译标志
$(TWEAK_NAME)_FILES_CFLAGS = -fobjc-arc \
                       -I$(THEOS_PROJECT_DIR)/DK \
                       -I$(THEOS_PROJECT_DIR)/DK \
                       -Wno-error \

# 框架依赖
$(TWEAK_NAME)_FILES_FRAMEWORKS = UIKit Foundation LocalAuthentication

# 包含 Theos make 系统
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

clean::
        @echo -e "\033[31m==>\033[0m 正在清理......"        # ← Tab 缩进
        @rm -rf .theos packages                           # ← Tab 缩进

after-package::
        @echo -e "\033[32m==>\033[0m 编译完成！生成deb包：$$(ls -t packages/*.deb | head -1)"  # ← Tab 缩进
        @echo -e "\033[32m==>\033[0m 请运行 ./install.sh 将插件安装到设备"                     # ← Tab 缩进