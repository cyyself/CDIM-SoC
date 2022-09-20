# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "spi_addr" -parent ${Page_0}


}

proc update_PARAM_VALUE.spi_addr { PARAM_VALUE.spi_addr } {
	# Procedure called to update spi_addr when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.spi_addr { PARAM_VALUE.spi_addr } {
	# Procedure called to validate spi_addr
	return true
}


proc update_MODELPARAM_VALUE.spi_addr { MODELPARAM_VALUE.spi_addr PARAM_VALUE.spi_addr } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.spi_addr}] ${MODELPARAM_VALUE.spi_addr}
}

