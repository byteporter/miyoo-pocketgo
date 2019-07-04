SHELL=/bin/sh
M4=m4
DTC=dtc
XZ=xz
UUENCODE=uuencode
AWK=awk
TAR=tar

FREQUENCIES=1000 15000 17000 20000 25000

OUTPUT_SCRIPTS=$(foreach freq,$(FREQUENCIES),switch-pwm-$(freq).sh)

.PHONY: all clean archive

all: $(OUTPUT_SCRIPTS)

archive: switch-pwm-scripts.tgz

clean:
	$(RM) suniv-f1c500s-miyoo-pwm-*.dts suniv-f1c500s-miyoo-pwm-*.dtb pwm-overlay-*.dts pwm-overlay-*.dtbo switch-pwm-*.sh switch-pwm-scripts.tgz

switch-pwm-scripts.tgz: $(OUTPUT_SCRIPTS)
	$(TAR) cfz $@ $^

suniv-f1c500s-miyoo-pwm-%.dts: suniv-f1c500s-miyoo.dts.m4
	$(M4) -P -D__PERIOD_NS="$$($(AWK) 'BEGIN { printf("%.0f", 1/$* * 10^9); }')" $< >$@

suniv-f1c500s-miyoo-pwm-%.dtb: suniv-f1c500s-miyoo-pwm-%.dts
	$(DTC) -I dts -O dtb -o $@ $<

pwm-overlay-%.dts: pwm-overlay.dts.m4
	$(M4) -P -D__PERIOD_NS="$$($(AWK) 'BEGIN { printf("%.0f", 1/$* * 10^9); }')" $< >$@

pwm-overlay-%.dtbo: pwm-overlay-%.dts
	$(DTC) -I dts -O dtb -o $@ $<

switch-pwm-%.sh: switch-pwm.sh.m4 suniv-f1c500s-miyoo-pwm-%.dtb
	$(M4) -P -D__DTB_XZ_B64="$$($(XZ) -c suniv-f1c500s-miyoo-pwm-$*.dtb | $(UUENCODE) -m /dev/stdout)" $< >$@
