# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_APB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_APB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L_MASK" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_APB { PARAM_VALUE.ADDR_APB } {
	# Procedure called to update ADDR_APB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_APB { PARAM_VALUE.ADDR_APB } {
	# Procedure called to validate ADDR_APB
	return true
}

proc update_PARAM_VALUE.DATA_APB { PARAM_VALUE.DATA_APB } {
	# Procedure called to update DATA_APB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_APB { PARAM_VALUE.DATA_APB } {
	# Procedure called to validate DATA_APB
	return true
}

proc update_PARAM_VALUE.L_ADDR { PARAM_VALUE.L_ADDR } {
	# Procedure called to update L_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L_ADDR { PARAM_VALUE.L_ADDR } {
	# Procedure called to validate L_ADDR
	return true
}

proc update_PARAM_VALUE.L_DATA { PARAM_VALUE.L_DATA } {
	# Procedure called to update L_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L_DATA { PARAM_VALUE.L_DATA } {
	# Procedure called to validate L_DATA
	return true
}

proc update_PARAM_VALUE.L_ID { PARAM_VALUE.L_ID } {
	# Procedure called to update L_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L_ID { PARAM_VALUE.L_ID } {
	# Procedure called to validate L_ID
	return true
}

proc update_PARAM_VALUE.L_MASK { PARAM_VALUE.L_MASK } {
	# Procedure called to update L_MASK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L_MASK { PARAM_VALUE.L_MASK } {
	# Procedure called to validate L_MASK
	return true
}


proc update_MODELPARAM_VALUE.ADDR_APB { MODELPARAM_VALUE.ADDR_APB PARAM_VALUE.ADDR_APB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_APB}] ${MODELPARAM_VALUE.ADDR_APB}
}

proc update_MODELPARAM_VALUE.DATA_APB { MODELPARAM_VALUE.DATA_APB PARAM_VALUE.DATA_APB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_APB}] ${MODELPARAM_VALUE.DATA_APB}
}

proc update_MODELPARAM_VALUE.L_ADDR { MODELPARAM_VALUE.L_ADDR PARAM_VALUE.L_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L_ADDR}] ${MODELPARAM_VALUE.L_ADDR}
}

proc update_MODELPARAM_VALUE.L_ID { MODELPARAM_VALUE.L_ID PARAM_VALUE.L_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L_ID}] ${MODELPARAM_VALUE.L_ID}
}

proc update_MODELPARAM_VALUE.L_DATA { MODELPARAM_VALUE.L_DATA PARAM_VALUE.L_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L_DATA}] ${MODELPARAM_VALUE.L_DATA}
}

proc update_MODELPARAM_VALUE.L_MASK { MODELPARAM_VALUE.L_MASK PARAM_VALUE.L_MASK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L_MASK}] ${MODELPARAM_VALUE.L_MASK}
}

