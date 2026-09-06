# Downgrade "Parallel synthesis criteria is not met" warning to be messaged as INFO
set_msg_config -id {Synth 8-7080} -new_severity INFO

# Downgrade "The IP file has been moved from its original location" warning to be messaged as INFO
set_msg_config -id {Vivado 12-13650} -new_severity INFO