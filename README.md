# CDIM-SoC

SoC for CQU Dual Issue Machine

## Board

[Nexys 4 DDR](https://digilent.com/reference/programmable-logic/nexys-4-ddr/start)

## Devices on the SoC

- 128M DDR2 MIG
- 256K BRAM for U-Boot
- AXI Ethernet Lite
- CONFREG (Used for Real-time Clock)
- AXI Interrupt Controller (Convert rising edge IRQ from AXI Ethernet lite to active high level IRQ for CPU)

## Related resources

[CQU Dual Issue Machine CPU Core](https://github.com/Maxpicca-Li/CDIM)

[U-Boot](https://github.com/cyyself/u-boot/tree/cdim_soc)

[Linux](https://github.com/cyyself/linux/tree/cdim_soc)

[uCore](https://github.com/cyyself/ucore-thumips/tree/cdim_soc)

## FAQ

- AXI Ethernet Lite transmit timeout in Linux

    If the `Enable Asynchronous Clock operation` is enabled in AXI Interrupt Controller, the CPU will not receive any ethernet interrupt from AXI Interrupt Controller (Who can tell me why?).
    
    This problem can be checked by `cat /proc/interrupts` and check whether the eth0 interrupt count is zero.

    If this option is enabled automatically by Vivado Block Design, you should manually disable this option.