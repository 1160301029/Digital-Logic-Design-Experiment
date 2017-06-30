
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
set scripts_vivado_version 2014.4
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
#    create_project project_1 myproj -part xc7a35tcsg324-3


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


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
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set CLRN [ create_bd_port -dir I CLRN ]
  set Q0 [ create_bd_port -dir O Q0 ]
  set Q1 [ create_bd_port -dir O Q1 ]
  set Q2 [ create_bd_port -dir O Q2 ]
  set Q3 [ create_bd_port -dir O Q3 ]

  # Create instance: D_trigger_0, and set properties
  set D_trigger_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:D_trigger:1.0 D_trigger_0 ]

  # Create instance: D_trigger_1, and set properties
  set D_trigger_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:D_trigger:1.0 D_trigger_1 ]

  # Create instance: D_trigger_2, and set properties
  set D_trigger_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:D_trigger:1.0 D_trigger_2 ]

  # Create instance: D_trigger_3, and set properties
  set D_trigger_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:D_trigger:1.0 D_trigger_3 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $util_vector_logic_2

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins D_trigger_0/CLK] [get_bd_pins D_trigger_1/CLK] [get_bd_pins D_trigger_2/CLK] [get_bd_pins D_trigger_3/CLK]
  connect_bd_net -net CLRN_1 [get_bd_ports CLRN] [get_bd_pins D_trigger_0/CLRN] [get_bd_pins D_trigger_1/CLRN] [get_bd_pins D_trigger_2/CLRN] [get_bd_pins D_trigger_3/CLRN]
  connect_bd_net -net D_trigger_0_Q [get_bd_ports Q0] [get_bd_pins D_trigger_0/Q]
  connect_bd_net -net D_trigger_1_Q [get_bd_ports Q1] [get_bd_pins D_trigger_0/D] [get_bd_pins D_trigger_1/Q] [get_bd_pins util_vector_logic_2/Op2]
  connect_bd_net -net D_trigger_2_Q [get_bd_ports Q2] [get_bd_pins D_trigger_1/D] [get_bd_pins D_trigger_2/Q] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net D_trigger_3_Q [get_bd_ports Q3] [get_bd_pins D_trigger_2/D] [get_bd_pins D_trigger_3/Q] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins D_trigger_3/D] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_0/Op2] [get_bd_pins util_vector_logic_2/Res]

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


