webtalk_init -webtalk_dir /home/daniel/SPI_project/SPI_project.sim/sim_1/behav/xsim/xsim.dir/Controller_TB_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Fri Mar 15 00:19:47 2019" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2018.3 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2405991" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "28f642d9-dd36-4b55-87ae-6a7e12997590" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "1e320b09970042919670bc3cf7daa1b5" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "120" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 18.04.2 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3890.329 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "16.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "20 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "5" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.02_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "133568_KB" -context "xsim\\usage"
webtalk_transmit -clientid 3511633605 -regid "" -xml /home/daniel/SPI_project/SPI_project.sim/sim_1/behav/xsim/xsim.dir/Controller_TB_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/daniel/SPI_project/SPI_project.sim/sim_1/behav/xsim/xsim.dir/Controller_TB_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/daniel/SPI_project/SPI_project.sim/sim_1/behav/xsim/xsim.dir/Controller_TB_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
