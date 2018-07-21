
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list CONFIG.FREQ_HZ {100000000}  ] $clk
  set m_axis_tdata [ create_bd_port -dir O -from 31 -to 0 m_axis_tdata ]
  set m_axis_tready [ create_bd_port -dir I m_axis_tready ]
  set m_axis_tvalid [ create_bd_port -dir O m_axis_tvalid ]
  set reset_n [ create_bd_port -dir I -type rst reset_n ]
  set s_axi_awaddr [ create_bd_port -dir I -from 3 -to 0 s_axi_awaddr ]
  set s_axi_awvalid [ create_bd_port -dir I s_axi_awvalid ]
  set s_axi_wdata [ create_bd_port -dir I -from 31 -to 0 s_axi_wdata ]
  set s_axi_wstrb [ create_bd_port -dir I -from 3 -to 0 s_axi_wstrb ]
  set s_axi_wvalid [ create_bd_port -dir I s_axi_wvalid ]
  set s_axis_tdata [ create_bd_port -dir I -from 31 -to 0 s_axis_tdata ]
  set s_axis_tready [ create_bd_port -dir O s_axis_tready ]
  set s_axis_tvalid [ create_bd_port -dir I s_axis_tvalid ]

  # Create instance: bypass_axis_0, and set properties
  set bypass_axis_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:bypass_axis:1.0 bypass_axis_0 ]

  # Create instance: bypass_axis_1, and set properties
  set bypass_axis_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:bypass_axis:1.0 bypass_axis_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net bypass_axis_1_M_AXIS [get_bd_intf_pins bypass_axis_0/S_AXIS] [get_bd_intf_pins bypass_axis_1/M_AXIS]

  # Create port connections
  connect_bd_net -net bypass_axis_0_m_axis_tdata [get_bd_ports m_axis_tdata] [get_bd_pins bypass_axis_0/m_axis_tdata]
  connect_bd_net -net bypass_axis_0_m_axis_tvalid [get_bd_ports m_axis_tvalid] [get_bd_pins bypass_axis_0/m_axis_tvalid]
  connect_bd_net -net bypass_axis_1_s_axis_tready [get_bd_ports s_axis_tready] [get_bd_pins bypass_axis_1/s_axis_tready]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins bypass_axis_0/m_axis_aclk] [get_bd_pins bypass_axis_0/s_axi_aclk] [get_bd_pins bypass_axis_0/s_axis_aclk] [get_bd_pins bypass_axis_1/m_axis_aclk] [get_bd_pins bypass_axis_1/s_axi_aclk] [get_bd_pins bypass_axis_1/s_axis_aclk]
  connect_bd_net -net m_axis_tready_1 [get_bd_ports m_axis_tready] [get_bd_pins bypass_axis_0/m_axis_tready]
  connect_bd_net -net reset_n_1 [get_bd_ports reset_n] [get_bd_pins bypass_axis_0/m_axis_aresetn] [get_bd_pins bypass_axis_0/s_axi_aresetn] [get_bd_pins bypass_axis_0/s_axis_aresetn] [get_bd_pins bypass_axis_1/m_axis_aresetn] [get_bd_pins bypass_axis_1/s_axi_aresetn] [get_bd_pins bypass_axis_1/s_axis_aresetn]
  connect_bd_net -net s_axi_awaddr_1 [get_bd_ports s_axi_awaddr] [get_bd_pins bypass_axis_0/s_axi_awaddr] [get_bd_pins bypass_axis_1/s_axi_awaddr]
  connect_bd_net -net s_axi_awvalid_1 [get_bd_ports s_axi_awvalid] [get_bd_pins bypass_axis_0/s_axi_awvalid] [get_bd_pins bypass_axis_1/s_axi_awvalid]
  connect_bd_net -net s_axi_wdata_1 [get_bd_ports s_axi_wdata] [get_bd_pins bypass_axis_0/s_axi_wdata] [get_bd_pins bypass_axis_1/s_axi_wdata]
  connect_bd_net -net s_axi_wstrb_1 [get_bd_ports s_axi_wstrb] [get_bd_pins bypass_axis_0/s_axi_wstrb] [get_bd_pins bypass_axis_1/s_axi_wstrb]
  connect_bd_net -net s_axi_wvalid_1 [get_bd_ports s_axi_wvalid] [get_bd_pins bypass_axis_0/s_axi_wvalid] [get_bd_pins bypass_axis_1/s_axi_wvalid]
  connect_bd_net -net s_axis_tdata_1 [get_bd_ports s_axis_tdata] [get_bd_pins bypass_axis_1/s_axis_tdata]
  connect_bd_net -net s_axis_tvalid_1 [get_bd_ports s_axis_tvalid] [get_bd_pins bypass_axis_1/s_axis_tvalid]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


