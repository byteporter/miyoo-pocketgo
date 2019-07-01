SHELL=/bin/sh
M4=m4
DTC=dtc
XZ=xz
UUENCODE=uuencode
AWK=awk

FREQUENCIES=1000 15000 17000 20000 25000

.PHONY: all

all: $(foreach freq,$(FREQUENCIES),switch-pwm-$(freq).sh)

clean:
	$(RM) suniv-f1c500s-miyoo-pwm-*.dts suniv-f1c500s-miyoo-pwm-*.dtb switch-pwm-*.sh

suniv-f1c500s-miyoo-pwm-%.dts: suniv-f1c500s-miyoo.dts.m4
	$(M4) -P -D__PERIOD_NS="$$($(AWK) 'BEGIN { printf("%.0f", 1/$* * 10^9); }')" $< >$@

suniv-f1c500s-miyoo-pwm-%.dtb: suniv-f1c500s-miyoo-pwm-%.dts
	$(DTC) -I dts -O dtb -o $@ $<

switch-pwm-%.sh: switch-pwm.sh.m4 suniv-f1c500s-miyoo-pwm-%.dtb
	$(M4) -P -D__DTB_XZ_B64="$$($(XZ) -c suniv-f1c500s-miyoo-pwm-$*.dtb | $(UUENCODE) -m /dev/stdout)" $< >$@
