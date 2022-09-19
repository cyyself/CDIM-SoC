# CDIM-SoC

SoC for CQU Dual Issue Machine

## Board

- NSCSCC Board (7a200t-2)

- [Nexys 4 DDR](https://github.com/cyyself/CDIM-SoC/tree/n4ddr_porting)

## Devices on the SoC

- 128M DDR3 MIG
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

- AXI Ethernet Link Down in Linux

    If you program this soc and didn't press the reset from cold, the AXI Ethernet Lite in Linux will show the link down. Although the ethernet seems fine in U-Boot.

    The solution is to press the reset button on the board to reset the ethernet phy and the whole system.

- AXI Ethernet Lite transmit timeout in Linux

    If the `Enable Asynchronous Clock operation` is enabled in AXI Interrupt Controller, the CPU will not receive any ethernet interrupt from AXI Interrupt Controller (Who can tell me why?).
    
    This problem can be checked by `cat /proc/interrupts` and check whether the eth0 interrupt count is zero.

    If this option is enabled automatically by Vivado Block Design, you should manually disable this option.
