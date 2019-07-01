/dts-v1/;

/ {
	#address-cells = <0x1>;
	#size-cells = <0x1>;
	interrupt-parent = <0x1>;
	model = "Miyoo Handheld";
	compatible = "allwinner,suniv-f1c500s";

	clocks {
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		ranges;

		clk-24M {
			#clock-cells = <0x0>;
			compatible = "fixed-clock";
			clock-frequency = <0x16e3600>;
			clock-output-names = "osc24M";
			linux,phandle = <0x6>;
			phandle = <0x6>;
		};

		clk-32k {
			#clock-cells = <0x0>;
			compatible = "fixed-clock";
			clock-frequency = <0x8000>;
			clock-output-names = "osc32k";
			linux,phandle = <0x7>;
			phandle = <0x7>;
		};
	};

	cpus {
		#address-cells = <0x0>;
		#size-cells = <0x0>;

		cpu {
			compatible = "arm,arm926ej-s";
			device_type = "cpu";
		};
	};

	soc {
		compatible = "simple-bus";
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		ranges;

		sram-controller@1c00000 {
			compatible = "allwinner,sun4i-a10-sram-controller";
			reg = <0x1c00000 0x30>;
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			ranges;

			sram@10000 {
				compatible = "mmio-sram";
				reg = <0x10000 0x1000>;
				#address-cells = <0x1>;
				#size-cells = <0x1>;
				ranges = <0x0 0x10000 0x1000>;

				sram-section@0 {
					compatible = "allwinner,sun4i-a10-sram-d";
					reg = <0x0 0x1000>;
					status = "okay";
					linux,phandle = <0xb>;
					phandle = <0xb>;
				};
			};
		};

		spi@1c05000 {
			compatible = "allwinner,suniv-f1c100s-spi", "allwinner,sun8i-h3-spi";
			reg = <0x1c05000 0x1000>;
			interrupts = <0xa>;
			clocks = <0x2 0x11 0x2 0x11>;
			clock-names = "ahb", "mod";
			resets = <0x2 0x4>;
			status = "okay";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			pinctrl-names = "default";
			pinctrl-0 = <0x3>;

			flash@0 {
				#address-cells = <0x1>;
				#size-cells = <0x1>;
				compatible = "winbond,w25q128", "jedec,spi-nor";
				reg = <0x0>;
				spi-max-frequency = <0x2625a00>;
			};
		};

		spi@1c06000 {
			compatible = "allwinner,suniv-f1c100s-spi", "allwinner,sun8i-h3-spi";
			reg = <0x1c06000 0x1000>;
			interrupts = <0xb>;
			clocks = <0x2 0x12 0x2 0x12>;
			clock-names = "ahb", "mod";
			resets = <0x2 0x5>;
			status = "disabled";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		tcon0@1c0c000 {
			compatible = "allwinner,suniv-f1c500s-tcon0";
			reg = <0x1c0c000 0x1000>;
			interrupts = <0x1d>;
			clocks = <0x2 0x15 0x2 0x39>;
			status = "okay";
		};

		dma-controller@01c02000 {
			compatible = "allwinner,suniv-dma";
			reg = <0x1c02000 0x1000>;
			#dma-cells = <0x1>;
		};

		mmc@1c0f000 {
			compatible = "allwinner,suniv-f1c100s-mmc", "allwinner,sun7i-a20-mmc";
			reg = <0x1c0f000 0x1000>;
			clocks = <0x2 0xe 0x2 0x28 0x2 0x2a 0x2 0x29>;
			clock-names = "ahb", "mmc", "output", "sample";
			resets = <0x2 0x1>;
			reset-names = "ahb";
			interrupts = <0x17>;
			pinctrl-names = "default";
			pinctrl-0 = <0x4>;
			status = "okay";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			vmmc-supply = <0x5>;
			bus-width = <0x4>;
			broken-cd;
		};

		mmc@1c10000 {
			compatible = "allwinner,suniv-f1c100s-mmc", "allwinner,sun7i-a20-mmc";
			reg = <0x1c10000 0x1000>;
			clocks = <0x2 0xf 0x2 0x2b 0x2 0x2d 0x2 0x2c>;
			clock-names = "ahb", "mmc", "output", "sample";
			resets = <0x2 0x2>;
			reset-names = "ahb";
			interrupts = <0x18>;
			status = "disabled";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		clock@1c20000 {
			compatible = "allwinner,suniv-f1c100s-ccu";
			reg = <0x1c20000 0x400>;
			clocks = <0x6 0x7>;
			clock-names = "hosc", "losc";
			#clock-cells = <0x1>;
			#reset-cells = <0x1>;
			linux,phandle = <0x2>;
			phandle = <0x2>;
		};

		interrupt-controller@1c20400 {
			compatible = "allwinner,suniv-f1c100s-ic";
			reg = <0x1c20400 0x400>;
			interrupt-controller;
			#interrupt-cells = <0x1>;
			linux,phandle = <0x1>;
			phandle = <0x1>;
		};

		pwm@01c21000 {
			compatible = "allwinner,suniv-pwm";
			reg = <0x1c21000 0x400>;
			clocks = <0x6>;
			#pwm-cells = <0x3>;
			status = "okay";
			pinctrl-names = "default";
			pinctrl-0 = <0x8>;
			linux,phandle = <0xd>;
			phandle = <0xd>;
		};

		pinctrl@1c20800 {
			compatible = "allwinner,suniv-f1c100s-pinctrl";
			reg = <0x1c20800 0x400>;
			interrupts = <0x26 0x27 0x28>;
			clocks = <0x2 0x24 0x6 0x7>;
			clock-names = "apb", "hosc", "losc";
			gpio-controller;
			interrupt-controller;
			#interrupt-cells = <0x3>;
			#gpio-cells = <0x3>;
			linux,phandle = <0xc>;
			phandle = <0xc>;

			pwm1 {
				pins = "PE6";
				function = "pwm1";
				linux,phandle = <0x8>;
				phandle = <0x8>;
			};

			spi0-pins-pc {
				pins = "PC0", "PC1", "PC2", "PC3";
				function = "spi0";
				linux,phandle = <0x3>;
				phandle = <0x3>;
			};

			uart-pins-pe {
				pins = "PE0", "PE1";
				function = "uart0";
			};

			uart-pins-pa {
				pins = "PA2", "PA3";
				function = "uart1";
				linux,phandle = <0x9>;
				phandle = <0x9>;
			};

			mmc0-pins {
				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
				function = "mmc0";
				linux,phandle = <0x4>;
				phandle = <0x4>;
			};
		};

		timer@1c20c00 {
			compatible = "allwinner,suniv-f1c100s-timer";
			reg = <0x1c20c00 0x90>;
			interrupts = <0xd>;
			clocks = <0x6>;
		};

		codec@1c22000 {
			compatible = "allwinner,suniv-f1c500s-codec";
			clocks = <0x2 0x1c 0x2 0x40>;
			interrupts = <0x12>;
			status = "okay";
		};

		battery@1c23400 {
			compatible = "allwinner,suniv-f1c500s-battery";
			reg = <0x1c23400 0x400>;
			status = "okay";
		};

		watchdog@1c20ca0 {
			compatible = "allwinner,sun6i-a31-wdt";
			reg = <0x1c20ca0 0x20>;
		};

		serial@1c25000 {
			compatible = "snps,dw-apb-uart";
			reg = <0x1c25000 0x400>;
			interrupts = <0x1>;
			reg-shift = <0x2>;
			reg-io-width = <0x4>;
			clocks = <0x2 0x25>;
			resets = <0x2 0x17>;
			status = "disabled";
		};

		serial@1c25400 {
			compatible = "snps,dw-apb-uart";
			reg = <0x1c25400 0x400>;
			interrupts = <0x2>;
			reg-shift = <0x2>;
			reg-io-width = <0x4>;
			clocks = <0x2 0x26>;
			resets = <0x2 0x18>;
			status = "okay";
			pinctrl-names = "default";
			pinctrl-0 = <0x9>;
		};

		serial@1c25800 {
			compatible = "snps,dw-apb-uart";
			reg = <0x1c25800 0x400>;
			interrupts = <0x3>;
			reg-shift = <0x2>;
			reg-io-width = <0x4>;
			clocks = <0x2 0x27>;
			resets = <0x2 0x19>;
			status = "disabled";
		};

		usb@1c13000 {
			compatible = "allwinner,suniv-f1c100s-musb";
			reg = <0x1c13000 0x400>;
			clocks = <0x2 0x13>;
			resets = <0x2 0x6>;
			interrupts = <0x1a>;
			interrupt-names = "mc";
			phys = <0xa 0x0>;
			phy-names = "usb";
			extcon = <0xa 0x0>;
			allwinner,sram = <0xb 0x1>;
			status = "okay";
			dr_mode = "otg";
		};

		phy@1c13400 {
			compatible = "allwinner,suniv-f1c100s-usb-phy";
			reg = <0x1c13400 0x10>;
			reg-names = "phy_ctrl";
			clocks = <0x2 0x30>;
			clock-names = "usb0_phy";
			resets = <0x2 0x0>;
			reset-names = "usb0_reset";
			#phy-cells = <0x1>;
			status = "okay";
			usb0_id_det-gpio = <0xc 0x4 0x2 0x0>;
			linux,phandle = <0xa>;
			phandle = <0xa>;
		};
	};

	aliases {
		serial1 = "/soc/serial@1c25400";
	};

	chosen {
		stdout-path = "serial1:115200n8";
	};

	backlight {
		compatible = "pwm-backlight";
        // The 3rd value of 'pwms' is the period in nanoseconds. 1/period=frequency.
		pwms = <0xd 0x1 __PERIOD_NS 0x0>;
		brightness-levels = <0x0 0xa 0x14 0x1e 0x28 0x32 0x3c 0x46 0x50 0x5a 0x64>;
		default-brightness-level = <0x5>;
		status = "okay";
	};

	vcc3v3 {
		compatible = "regulator-fixed";
		regulator-name = "vcc3v3";
		regulator-min-microvolt = <0x325aa0>;
		regulator-max-microvolt = <0x325aa0>;
		linux,phandle = <0x5>;
		phandle = <0x5>;
	};
};
