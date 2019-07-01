SHELL=/bin/sh
M4=/usr/bin/m4
DTC=/usr/bin/dtc

FREQUENCY=1000
PERIOD_NS=$(shell awk 'BEGIN {print 1/$(FREQUENCY) * 1000000000;}')

.PHONY: all

all: suniv-f1c500s-miyoo-pwm-$(FREQUENCY).dtb

clean:
	$(RM) suniv-f1c500s-miyoo-pwm-*.dts suniv-f1c500s-miyoo-pwm-*.dtb

suniv-f1c500s-miyoo-pwm-$(FREQUENCY).dts: suniv-f1c500s-miyoo.dts.m4
	$(M4) -P -D__PERIOD_NS='$(PERIOD_NS)' $< >$@

suniv-f1c500s-miyoo-pwm-$(FREQUENCY).dtb: suniv-f1c500s-miyoo-pwm-$(FREQUENCY).dts
	$(DTC) -I dts -O dtb -o $@ $<
