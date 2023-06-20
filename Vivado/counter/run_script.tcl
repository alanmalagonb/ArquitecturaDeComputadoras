# Crear un nuevo proyecto
create_project -force my_project ./my_project

puts [pwd]

# Agregar archivos fuente al proyecto
add_files clear_DUT.sv
add_files top.sv

# Set the top-level module
set_property top top [current_fileset]

# Run synthesis
synth_design

# Optimize design
opt_design

# Place and route
place_design
route_design

# Generate the bitstream
write_bitstream -force ./my_project.bit

# Exit Vivado
exit