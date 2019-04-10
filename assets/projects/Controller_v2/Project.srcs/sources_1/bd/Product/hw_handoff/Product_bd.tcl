
################################################################
# This is a generated script based on design: Product
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
set scripts_vivado_version 2018.3
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
# source Product_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# CONTROLLER

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name Product

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
  variable design_name

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
  set CE_MOT0 [ create_bd_port -dir O CE_MOT0 ]
  set CE_MOT1 [ create_bd_port -dir O CE_MOT1 ]
  set CLK_100MHZ [ create_bd_port -dir I -type clk CLK_100MHZ ]
  set ENC0 [ create_bd_port -dir I -from 1 -to 0 ENC0 ]
  set ENC1 [ create_bd_port -dir I -from 1 -to 0 ENC1 ]
  set HALL0 [ create_bd_port -dir I HALL0 ]
  set HALL1 [ create_bd_port -dir I HALL1 ]
  set MISO [ create_bd_port -dir O MISO ]
  set MOSI [ create_bd_port -dir I MOSI ]
  set MOT0 [ create_bd_port -dir O -from 1 -to 0 MOT0 ]
  set MOT1 [ create_bd_port -dir O -from 1 -to 0 MOT1 ]
  set SCK [ create_bd_port -dir I SCK ]
  set SS [ create_bd_port -dir I SS ]

  # Create instance: CONTROLLER_0, and set properties
  set block_name CONTROLLER
  set block_cell_name CONTROLLER_0
  if { [catch {set CONTROLLER_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CONTROLLER_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net CONTROLLER_0_CE_M0T0 [get_bd_ports CE_MOT0] [get_bd_pins CONTROLLER_0/CE_MOT0]
  connect_bd_net -net CONTROLLER_0_CE_M0T1 [get_bd_ports CE_MOT1] [get_bd_pins CONTROLLER_0/CE_MOT1]
  connect_bd_net -net CONTROLLER_0_MOT0_out [get_bd_ports MOT0] [get_bd_pins CONTROLLER_0/MOT0_out]
  connect_bd_net -net CONTROLLER_0_MOT1_out [get_bd_ports MOT1] [get_bd_pins CONTROLLER_0/MOT1_out]
  connect_bd_net -net CONTROLLER_0_miso [get_bd_ports MISO] [get_bd_pins CONTROLLER_0/miso]
  connect_bd_net -net ENC0_0_1 [get_bd_ports ENC0] [get_bd_pins CONTROLLER_0/ENC0]
  connect_bd_net -net ENC1_0_1 [get_bd_ports ENC1] [get_bd_pins CONTROLLER_0/ENC1]
  connect_bd_net -net clk_0_1 [get_bd_ports CLK_100MHZ] [get_bd_pins CONTROLLER_0/clk]
  connect_bd_net -net hall_i_0_0_1 [get_bd_ports HALL0] [get_bd_pins CONTROLLER_0/hall_i_0]
  connect_bd_net -net hall_i_1_0_1 [get_bd_ports HALL1] [get_bd_pins CONTROLLER_0/hall_i_1]
  connect_bd_net -net mosi_0_1 [get_bd_ports MOSI] [get_bd_pins CONTROLLER_0/mosi]
  connect_bd_net -net sck_0_1 [get_bd_ports SCK] [get_bd_pins CONTROLLER_0/sck]
  connect_bd_net -net ss_0_1 [get_bd_ports SS] [get_bd_pins CONTROLLER_0/ss]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


