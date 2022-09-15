# CDIM-SoC

SoC for CQU Dual Issue Machine

## Board

NSCSCC Board (7a200t-2)

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