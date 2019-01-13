# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "IMAGE_HEIGHT"
  ipgui::add_param $IPINST -name "IMAGE_WIDTH"
  ipgui::add_param $IPINST -name "KERNEL_SIZE"
  ipgui::add_param $IPINST -name "FP_WORD_LENGTH"
  ipgui::add_param $IPINST -name "FP_FRAC_LENGTH"
  ipgui::add_param $IPINST -name "KERNEL_00"
  ipgui::add_param $IPINST -name "KERNEL_01"
  ipgui::add_param $IPINST -name "KERNEL_02"
  ipgui::add_param $IPINST -name "KERNEL_10"
  ipgui::add_param $IPINST -name "KERNEL_11"
  ipgui::add_param $IPINST -name "KERNEL_12"
  ipgui::add_param $IPINST -name "KERNEL_20"
  ipgui::add_param $IPINST -name "KERNEL_21"
  ipgui::add_param $IPINST -name "KERNEL_22"

}

proc update_PARAM_VALUE.FP_FRAC_LENGTH { PARAM_VALUE.FP_FRAC_LENGTH } {
	# Procedure called to update FP_FRAC_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FP_FRAC_LENGTH { PARAM_VALUE.FP_FRAC_LENGTH } {
	# Procedure called to validate FP_FRAC_LENGTH
	return true
}

proc update_PARAM_VALUE.FP_WORD_LENGTH { PARAM_VALUE.FP_WORD_LENGTH } {
	# Procedure called to update FP_WORD_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FP_WORD_LENGTH { PARAM_VALUE.FP_WORD_LENGTH } {
	# Procedure called to validate FP_WORD_LENGTH
	return true
}

proc update_PARAM_VALUE.IMAGE_HEIGHT { PARAM_VALUE.IMAGE_HEIGHT } {
	# Procedure called to update IMAGE_HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMAGE_HEIGHT { PARAM_VALUE.IMAGE_HEIGHT } {
	# Procedure called to validate IMAGE_HEIGHT
	return true
}

proc update_PARAM_VALUE.IMAGE_WIDTH { PARAM_VALUE.IMAGE_WIDTH } {
	# Procedure called to update IMAGE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMAGE_WIDTH { PARAM_VALUE.IMAGE_WIDTH } {
	# Procedure called to validate IMAGE_WIDTH
	return true
}

proc update_PARAM_VALUE.KERNEL_00 { PARAM_VALUE.KERNEL_00 } {
	# Procedure called to update KERNEL_00 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_00 { PARAM_VALUE.KERNEL_00 } {
	# Procedure called to validate KERNEL_00
	return true
}

proc update_PARAM_VALUE.KERNEL_01 { PARAM_VALUE.KERNEL_01 } {
	# Procedure called to update KERNEL_01 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_01 { PARAM_VALUE.KERNEL_01 } {
	# Procedure called to validate KERNEL_01
	return true
}

proc update_PARAM_VALUE.KERNEL_02 { PARAM_VALUE.KERNEL_02 } {
	# Procedure called to update KERNEL_02 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_02 { PARAM_VALUE.KERNEL_02 } {
	# Procedure called to validate KERNEL_02
	return true
}

proc update_PARAM_VALUE.KERNEL_10 { PARAM_VALUE.KERNEL_10 } {
	# Procedure called to update KERNEL_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_10 { PARAM_VALUE.KERNEL_10 } {
	# Procedure called to validate KERNEL_10
	return true
}

proc update_PARAM_VALUE.KERNEL_11 { PARAM_VALUE.KERNEL_11 } {
	# Procedure called to update KERNEL_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_11 { PARAM_VALUE.KERNEL_11 } {
	# Procedure called to validate KERNEL_11
	return true
}

proc update_PARAM_VALUE.KERNEL_12 { PARAM_VALUE.KERNEL_12 } {
	# Procedure called to update KERNEL_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_12 { PARAM_VALUE.KERNEL_12 } {
	# Procedure called to validate KERNEL_12
	return true
}

proc update_PARAM_VALUE.KERNEL_20 { PARAM_VALUE.KERNEL_20 } {
	# Procedure called to update KERNEL_20 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_20 { PARAM_VALUE.KERNEL_20 } {
	# Procedure called to validate KERNEL_20
	return true
}

proc update_PARAM_VALUE.KERNEL_21 { PARAM_VALUE.KERNEL_21 } {
	# Procedure called to update KERNEL_21 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_21 { PARAM_VALUE.KERNEL_21 } {
	# Procedure called to validate KERNEL_21
	return true
}

proc update_PARAM_VALUE.KERNEL_22 { PARAM_VALUE.KERNEL_22 } {
	# Procedure called to update KERNEL_22 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_22 { PARAM_VALUE.KERNEL_22 } {
	# Procedure called to validate KERNEL_22
	return true
}

proc update_PARAM_VALUE.KERNEL_SIZE { PARAM_VALUE.KERNEL_SIZE } {
	# Procedure called to update KERNEL_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.KERNEL_SIZE { PARAM_VALUE.KERNEL_SIZE } {
	# Procedure called to validate KERNEL_SIZE
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_START_COUNT { PARAM_VALUE.C_M_AXIS_START_COUNT } {
	# Procedure called to update C_M_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_START_COUNT { PARAM_VALUE.C_M_AXIS_START_COUNT } {
	# Procedure called to validate C_M_AXIS_START_COUNT
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_START_COUNT { MODELPARAM_VALUE.C_M_AXIS_START_COUNT PARAM_VALUE.C_M_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S_AXI_DATA_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S_AXI_ADDR_WIDTH". Setting updated value from the model parameter.
set_property value 6 ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.IMAGE_HEIGHT { MODELPARAM_VALUE.IMAGE_HEIGHT PARAM_VALUE.IMAGE_HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMAGE_HEIGHT}] ${MODELPARAM_VALUE.IMAGE_HEIGHT}
}

proc update_MODELPARAM_VALUE.IMAGE_WIDTH { MODELPARAM_VALUE.IMAGE_WIDTH PARAM_VALUE.IMAGE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMAGE_WIDTH}] ${MODELPARAM_VALUE.IMAGE_WIDTH}
}

proc update_MODELPARAM_VALUE.KERNEL_SIZE { MODELPARAM_VALUE.KERNEL_SIZE PARAM_VALUE.KERNEL_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_SIZE}] ${MODELPARAM_VALUE.KERNEL_SIZE}
}

proc update_MODELPARAM_VALUE.FP_WORD_LENGTH { MODELPARAM_VALUE.FP_WORD_LENGTH PARAM_VALUE.FP_WORD_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FP_WORD_LENGTH}] ${MODELPARAM_VALUE.FP_WORD_LENGTH}
}

proc update_MODELPARAM_VALUE.FP_FRAC_LENGTH { MODELPARAM_VALUE.FP_FRAC_LENGTH PARAM_VALUE.FP_FRAC_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FP_FRAC_LENGTH}] ${MODELPARAM_VALUE.FP_FRAC_LENGTH}
}

proc update_MODELPARAM_VALUE.KERNEL_00 { MODELPARAM_VALUE.KERNEL_00 PARAM_VALUE.KERNEL_00 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_00}] ${MODELPARAM_VALUE.KERNEL_00}
}

proc update_MODELPARAM_VALUE.KERNEL_01 { MODELPARAM_VALUE.KERNEL_01 PARAM_VALUE.KERNEL_01 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_01}] ${MODELPARAM_VALUE.KERNEL_01}
}

proc update_MODELPARAM_VALUE.KERNEL_02 { MODELPARAM_VALUE.KERNEL_02 PARAM_VALUE.KERNEL_02 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_02}] ${MODELPARAM_VALUE.KERNEL_02}
}

proc update_MODELPARAM_VALUE.KERNEL_10 { MODELPARAM_VALUE.KERNEL_10 PARAM_VALUE.KERNEL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_10}] ${MODELPARAM_VALUE.KERNEL_10}
}

proc update_MODELPARAM_VALUE.KERNEL_11 { MODELPARAM_VALUE.KERNEL_11 PARAM_VALUE.KERNEL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_11}] ${MODELPARAM_VALUE.KERNEL_11}
}

proc update_MODELPARAM_VALUE.KERNEL_12 { MODELPARAM_VALUE.KERNEL_12 PARAM_VALUE.KERNEL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_12}] ${MODELPARAM_VALUE.KERNEL_12}
}

proc update_MODELPARAM_VALUE.KERNEL_20 { MODELPARAM_VALUE.KERNEL_20 PARAM_VALUE.KERNEL_20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_20}] ${MODELPARAM_VALUE.KERNEL_20}
}

proc update_MODELPARAM_VALUE.KERNEL_21 { MODELPARAM_VALUE.KERNEL_21 PARAM_VALUE.KERNEL_21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_21}] ${MODELPARAM_VALUE.KERNEL_21}
}

proc update_MODELPARAM_VALUE.KERNEL_22 { MODELPARAM_VALUE.KERNEL_22 PARAM_VALUE.KERNEL_22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.KERNEL_22}] ${MODELPARAM_VALUE.KERNEL_22}
}

