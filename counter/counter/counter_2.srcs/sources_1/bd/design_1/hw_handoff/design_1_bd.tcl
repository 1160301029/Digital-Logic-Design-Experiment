
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcsg324-1
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

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set A0 [ create_bd_port -dir O A0 ]
  set A1 [ create_bd_port -dir O A1 ]
  set A2 [ create_bd_port -dir O A2 ]
  set A3 [ create_bd_port -dir O A3 ]
  set CLK [ create_bd_port -dir I CLK ]
  set N [ create_bd_port -dir I N ]
  set clr [ create_bd_port -dir I clr ]

  # Create instance: AND_0, and set properties
  set AND_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:AND:1.0 AND_0 ]

  # Create instance: AND_1, and set properties
  set AND_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:AND:1.0 AND_1 ]

  # Create instance: AND_2, and set properties
  set AND_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:AND:1.0 AND_2 ]

  # Create instance: AND_3, and set properties
  set AND_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:AND:1.0 AND_3 ]

  # Create instance: AND_4, and set properties
  set AND_4 [ create_bd_cell -type ip -vlnv xilinx.com:user:AND:1.0 AND_4 ]

  # Create instance: JK_f_f_0, and set properties
  set JK_f_f_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:JK_f_f:1.0 JK_f_f_0 ]

  # Create instance: JK_f_f_1, and set properties
  set JK_f_f_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:JK_f_f:1.0 JK_f_f_1 ]

  # Create instance: JK_f_f_2, and set properties
  set JK_f_f_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:JK_f_f:1.0 JK_f_f_2 ]

  # Create instance: JK_f_f_3, and set properties
  set JK_f_f_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:JK_f_f:1.0 JK_f_f_3 ]

  # Create port connections
  connect_bd_net -net AND_0_F [get_bd_pins AND_0/F] [get_bd_pins JK_f_f_0/K] [get_bd_pins JK_f_f_1/K]
  connect_bd_net -net AND_1_F [get_bd_pins AND_1/F] [get_bd_pins AND_2/A]
  connect_bd_net -net AND_2_F [get_bd_pins AND_2/F] [get_bd_pins JK_f_f_0/J]
  connect_bd_net -net AND_3_F [get_bd_pins AND_3/F] [get_bd_pins JK_f_f_1/J]
  connect_bd_net -net AND_4_F [get_bd_pins AND_3/A] [get_bd_pins AND_4/F]
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins JK_f_f_0/clk] [get_bd_pins JK_f_f_1/clk] [get_bd_pins JK_f_f_2/clk] [get_bd_pins JK_f_f_3/clk]
  connect_bd_net -net JK_f_f_0_Q [get_bd_ports A0] [get_bd_pins JK_f_f_0/Q]
  connect_bd_net -net JK_f_f_0_Qb [get_bd_pins AND_3/B] [get_bd_pins JK_f_f_0/Qb]
  connect_bd_net -net JK_f_f_1_Q [get_bd_ports A1] [get_bd_pins AND_2/B] [get_bd_pins JK_f_f_1/Q]
  connect_bd_net -net JK_f_f_2_Q [get_bd_ports A2] [get_bd_pins AND_0/B] [get_bd_pins AND_1/B] [get_bd_pins AND_4/B] [get_bd_pins JK_f_f_2/Q]
  connect_bd_net -net JK_f_f_3_Q [get_bd_ports A3] [get_bd_pins AND_0/A] [get_bd_pins AND_1/A] [get_bd_pins AND_4/A] [get_bd_pins JK_f_f_2/J] [get_bd_pins JK_f_f_2/K] [get_bd_pins JK_f_f_3/Q]
  connect_bd_net -net N_1 [get_bd_ports N] [get_bd_pins JK_f_f_3/J] [get_bd_pins JK_f_f_3/K]
  connect_bd_net -net clr_1 [get_bd_ports clr] [get_bd_pins JK_f_f_0/clr] [get_bd_pins JK_f_f_1/clr] [get_bd_pins JK_f_f_2/clr] [get_bd_pins JK_f_f_3/clr]

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


