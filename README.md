# CDIM-SoC

SoC for CQU Dual Issue Machine

## Board

[Nexys 4 DDR](https://digilent.com/reference/programmable-logic/nexys-4-ddr/start)

## Devices on the SoC

- 128M DDR2 MIG
- SPI Flash Controller (from Loongson)
- AXI Ethernet Lite
- CONFREG (Used for Real-time Clock)
- AXI Interrupt Controller (Convert rising edge IRQ from AXI Ethernet lite to active high level IRQ for CPU)

## Program FSBL to SPI Flash

Since only 256KB BRAM consumes 50% BRAM of 7a100T FPGA. The FSBL (First Stage Bootloader) in this SoC stores in onboard SPI Flash instead of FPGA BRAM in the NSCSCC board.

You need to program the Flash by the following steps:

1. Goto **Hardware Manager** in Vivado.
2. Connect your board and open target.
3. Right click **xc7a100t_0**, enter **Add Configuration Memory Device**.
4. Select **s25fl128sxxxxxx0-spi-x1_x2_x4**.
5. Program the flash by `u-boot.bin`.

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

- Can I replace godson spi with Xilinx AXI Quad SPI?

    I tried but failed.
    
    In Standard mode, the first read request will return 0xf response. But it seems normal from the second request.

    In Dual mode, the first read request will return 0x0 response. But it seems normal from the second request.

    In Quad mode, all read request will return 0xc response.