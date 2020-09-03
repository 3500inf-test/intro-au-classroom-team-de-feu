#
# NOTE: on peut aussi lancer Vivado et l'exécution des commandes de ce fichier
# directement de l'invite de cmomande de Windows avec la commande :
# C:\Xilinx\Vivado\2020.1\bin\vivado -mode tcl -source labo-1-synth-impl.tcl

# --------------------------------------------------------------------------------------------------------
# Choisir le réperoire de travail
cd C:\Users\Pierre\Documents\GitHub\inf3500\trimestre-202003\exemples\synthese-implementation
# Lancer Vivado
C:\Xilinx\Vivado\2020.1\bin\vivado -mode tcl

# --------------------------------------------------------------------------------------------------------
# lecture des fichiers
remove_files [get_files]
read_vhdl -vhdl2008 ../basys3_top_exemples.vhd
read_xdc ../Basys-3-top.xdc

# --------------------------------------------------------------------------------------------------------
# synthese
set montic [clock format [clock seconds] -format %H:%M:%S]
puts "Il est presentement : $montic"
synth_design -top basys3_top_exemples -part xc7a35tcpg236-1 -assert
	
# --------------------------------------------------------------------------------------------------------
# implémentation (placement et routage)
set systemTime [clock seconds]
puts "Il est presentement : [clock format $systemTime -format %H:%M:%S]"
#opt_design
place_design
route_design

# --------------------------------------------------------------------------------------------------------
# génération du fichier de configuration
puts "J'ai commence a $montic"
set systemTime [clock seconds]
puts "Il est presentement : [clock format $systemTime -format %H:%M:%S]"
write_bitstream -force basys3-top.bit

# --------------------------------------------------------------------------------------------------------
# programmation du FPGA
open_hw_manager
connect_hw_server
get_hw_targets
open_hw_target
current_hw_device [get_hw_devices xc7a35t_0]
set_property PROGRAM.FILE {basys3-top.bit} [get_hw_devices xc7a35t_0]
program_hw_devices [get_hw_devices xc7a35t_0]
disconnect_hw_server

# --------------------------------------------------------------------------------------------------------
# c'est fini
puts "J'ai commence a $montic"
set systemTime [clock seconds]
puts "Il est presentement : [clock format $systemTime -format %H:%M:%S]"
# --------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------
