/dts-v1/;
/plugin/;

/{ 
    compatible = "allwinner,suniv-f1c500s";

    fragment@0 {
        target-path = "/backlight";
        __overlay__ {
            pwms = < &{/soc/pwm@01c21000} 1 __PERIOD_NS 0>;
        };
    };
};

