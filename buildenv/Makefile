SHELL=/bin/sh

ARCH=arm
CROSS_COMPILE=arm-linux-
INSTALL_MOD_PATH=rootfs

VERSION=4.14.0
LOCALVERSION=-miyoo-bp

.PHONY: all clean

all: linux-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION).tar.gz

clean:
	cd linux && $(RM) -r $(INSTALL_MOD_PATH) linux-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION).tar.gz

linux-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION).tar.gz:
	cd linux \
	&& $(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) zImage modules \
	&& $(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) modules_install \
	&& mkdir -p $(INSTALL_MOD_PATH)/boot \
	&& cp arch/arm/boot/zImage $(INSTALL_MOD_PATH)/boot/zImage-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION) \
	&& cp System.map $(INSTALL_MOD_PATH)/boot/System.map-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION) \
	&& cp .config $(INSTALL_MOD_PATH)/boot/config-$(VERSION)$(LOCALVERSION)$(EXTRAVERSION) \
	&& tar cfz $@ -C $(INSTALL_MOD_PATH) .

