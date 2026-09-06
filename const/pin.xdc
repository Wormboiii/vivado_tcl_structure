# Clock Setting, get 50MHz XO
set_property IOSTANDARD LVCMOS33    [get_ports {sys_clk}]
set_property PACKAGE_PIN Y18        [get_ports {sys_clk}]

# Reset Setting
set_property IOSTANDARD LVCMOS33    [get_ports {rst_n}]
set_property PACKAGE_PIN F20        [get_ports {rst_n}]

# IO Setting
set_property PACKAGE_PIN F19        [get_ports {led_1}]
set_property IOSTANDARD LVCMOS33    [get_ports {led_1}]

set_property PACKAGE_PIN E21        [get_ports {led_2}]
set_property IOSTANDARD LVCMOS33    [get_ports {led_2}]