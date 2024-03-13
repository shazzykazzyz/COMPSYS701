// Nios_System_2A.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module Nios_System_2A (
		input  wire [1:0]  button_pio_external_connection_export, // button_pio_external_connection.export
		input  wire        clocks_ref_clk_clk,                    //                 clocks_ref_clk.clk
		input  wire        clocks_ref_reset_reset,                //               clocks_ref_reset.reset
		output wire        clocks_sdram_clk_clk,                  //               clocks_sdram_clk.clk
		output wire [7:0]  led_pio_external_connection_export,    //    led_pio_external_connection.export
		output wire [12:0] sdram_wire_addr,                       //                     sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                         //                               .ba
		output wire        sdram_wire_cas_n,                      //                               .cas_n
		output wire        sdram_wire_cke,                        //                               .cke
		output wire        sdram_wire_cs_n,                       //                               .cs_n
		inout  wire [15:0] sdram_wire_dq,                         //                               .dq
		output wire [1:0]  sdram_wire_dqm,                        //                               .dqm
		output wire        sdram_wire_ras_n,                      //                               .ras_n
		output wire        sdram_wire_we_n                        //                               .we_n
	);

	wire         clocks_sys_clk_clk;                                        // clocks:sys_clk_clk -> [BUTTON_pio:clk, LED_pio:clk, cpu:clk, high_res_timer:clk, irq_mapper:clk, jtag_uart:clk, mm_interconnect_0:clocks_sys_clk_clk, onchip_memory:clk, rst_controller:clk, sdram:clk]
	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire         cpu_data_master_debugaccess;                               // cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire  [27:0] cpu_data_master_address;                                   // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                                // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         cpu_data_master_read;                                      // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire         cpu_data_master_write;                                     // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire  [31:0] cpu_data_master_writedata;                                 // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [27:0] cpu_instruction_master_address;                            // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                               // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;            // cpu:debug_mem_slave_readdata -> mm_interconnect_0:cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;         // cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;         // mm_interconnect_0:cpu_debug_mem_slave_debugaccess -> cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;             // mm_interconnect_0:cpu_debug_mem_slave_address -> cpu:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;                // mm_interconnect_0:cpu_debug_mem_slave_read -> cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;          // mm_interconnect_0:cpu_debug_mem_slave_byteenable -> cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;               // mm_interconnect_0:cpu_debug_mem_slave_write -> cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;           // mm_interconnect_0:cpu_debug_mem_slave_writedata -> cpu:debug_mem_slave_writedata
	wire         mm_interconnect_0_onchip_memory_s1_chipselect;             // mm_interconnect_0:onchip_memory_s1_chipselect -> onchip_memory:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_readdata;               // onchip_memory:readdata -> mm_interconnect_0:onchip_memory_s1_readdata
	wire  [12:0] mm_interconnect_0_onchip_memory_s1_address;                // mm_interconnect_0:onchip_memory_s1_address -> onchip_memory:address
	wire   [3:0] mm_interconnect_0_onchip_memory_s1_byteenable;             // mm_interconnect_0:onchip_memory_s1_byteenable -> onchip_memory:byteenable
	wire         mm_interconnect_0_onchip_memory_s1_write;                  // mm_interconnect_0:onchip_memory_s1_write -> onchip_memory:write
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_writedata;              // mm_interconnect_0:onchip_memory_s1_writedata -> onchip_memory:writedata
	wire         mm_interconnect_0_onchip_memory_s1_clken;                  // mm_interconnect_0:onchip_memory_s1_clken -> onchip_memory:clken
	wire         mm_interconnect_0_led_pio_s1_chipselect;                   // mm_interconnect_0:LED_pio_s1_chipselect -> LED_pio:chipselect
	wire  [31:0] mm_interconnect_0_led_pio_s1_readdata;                     // LED_pio:readdata -> mm_interconnect_0:LED_pio_s1_readdata
	wire   [1:0] mm_interconnect_0_led_pio_s1_address;                      // mm_interconnect_0:LED_pio_s1_address -> LED_pio:address
	wire         mm_interconnect_0_led_pio_s1_write;                        // mm_interconnect_0:LED_pio_s1_write -> LED_pio:write_n
	wire  [31:0] mm_interconnect_0_led_pio_s1_writedata;                    // mm_interconnect_0:LED_pio_s1_writedata -> LED_pio:writedata
	wire         mm_interconnect_0_sdram_s1_chipselect;                     // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;                       // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;                    // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;                        // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;                           // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;                     // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;                  // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;                          // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;                      // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire         mm_interconnect_0_high_res_timer_s1_chipselect;            // mm_interconnect_0:high_res_timer_s1_chipselect -> high_res_timer:chipselect
	wire  [15:0] mm_interconnect_0_high_res_timer_s1_readdata;              // high_res_timer:readdata -> mm_interconnect_0:high_res_timer_s1_readdata
	wire   [2:0] mm_interconnect_0_high_res_timer_s1_address;               // mm_interconnect_0:high_res_timer_s1_address -> high_res_timer:address
	wire         mm_interconnect_0_high_res_timer_s1_write;                 // mm_interconnect_0:high_res_timer_s1_write -> high_res_timer:write_n
	wire  [15:0] mm_interconnect_0_high_res_timer_s1_writedata;             // mm_interconnect_0:high_res_timer_s1_writedata -> high_res_timer:writedata
	wire         mm_interconnect_0_button_pio_s1_chipselect;                // mm_interconnect_0:BUTTON_pio_s1_chipselect -> BUTTON_pio:chipselect
	wire  [31:0] mm_interconnect_0_button_pio_s1_readdata;                  // BUTTON_pio:readdata -> mm_interconnect_0:BUTTON_pio_s1_readdata
	wire   [1:0] mm_interconnect_0_button_pio_s1_address;                   // mm_interconnect_0:BUTTON_pio_s1_address -> BUTTON_pio:address
	wire         mm_interconnect_0_button_pio_s1_write;                     // mm_interconnect_0:BUTTON_pio_s1_write -> BUTTON_pio:write_n
	wire  [31:0] mm_interconnect_0_button_pio_s1_writedata;                 // mm_interconnect_0:BUTTON_pio_s1_writedata -> BUTTON_pio:writedata
	wire         irq_mapper_receiver0_irq;                                  // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                  // high_res_timer:irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                  // BUTTON_pio:irq -> irq_mapper:receiver2_irq
	wire  [31:0] cpu_irq_irq;                                               // irq_mapper:sender_irq -> cpu:irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [BUTTON_pio:reset_n, LED_pio:reset_n, cpu:reset_n, high_res_timer:reset_n, irq_mapper:reset, jtag_uart:rst_n, mm_interconnect_0:cpu_reset_reset_bridge_in_reset_reset, onchip_memory:reset, rst_translator:in_reset, sdram:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [cpu:reset_req, onchip_memory:reset_req, rst_translator:reset_req_in]
	wire         cpu_debug_reset_request_reset;                             // cpu:debug_reset_request -> rst_controller:reset_in0

	Nios_System_2A_BUTTON_pio button_pio (
		.clk        (clocks_sys_clk_clk),                         //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),            //               reset.reset_n
		.address    (mm_interconnect_0_button_pio_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_button_pio_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_button_pio_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_button_pio_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_button_pio_s1_readdata),   //                    .readdata
		.in_port    (button_pio_external_connection_export),      // external_connection.export
		.irq        (irq_mapper_receiver2_irq)                    //                 irq.irq
	);

	Nios_System_2A_LED_pio led_pio (
		.clk        (clocks_sys_clk_clk),                      //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),         //               reset.reset_n
		.address    (mm_interconnect_0_led_pio_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_pio_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_pio_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_pio_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_pio_s1_readdata),   //                    .readdata
		.out_port   (led_pio_external_connection_export)       // external_connection.export
	);

	Nios_System_2A_clocks clocks (
		.ref_clk_clk        (clocks_ref_clk_clk),     //      ref_clk.clk
		.ref_reset_reset    (clocks_ref_reset_reset), //    ref_reset.reset
		.sys_clk_clk        (clocks_sys_clk_clk),     //      sys_clk.clk
		.sdram_clk_clk      (clocks_sdram_clk_clk),   //    sdram_clk.clk
		.reset_source_reset ()                        // reset_source.reset
	);

	Nios_System_2A_cpu cpu (
		.clk                                 (clocks_sys_clk_clk),                                //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	Nios_System_2A_high_res_timer high_res_timer (
		.clk        (clocks_sys_clk_clk),                             //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                // reset.reset_n
		.address    (mm_interconnect_0_high_res_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_high_res_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_high_res_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_high_res_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_high_res_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver1_irq)                        //   irq.irq
	);

	Nios_System_2A_jtag_uart jtag_uart (
		.clk            (clocks_sys_clk_clk),                                        //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	Nios_System_2A_onchip_memory onchip_memory (
		.clk        (clocks_sys_clk_clk),                            //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),            //       .reset_req
		.freeze     (1'b0)                                           // (terminated)
	);

	Nios_System_2A_sdram sdram (
		.clk            (clocks_sys_clk_clk),                       //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	Nios_System_2A_mm_interconnect_0 mm_interconnect_0 (
		.clocks_sys_clk_clk                      (clocks_sys_clk_clk),                                        //                  clocks_sys_clk.clk
		.cpu_reset_reset_bridge_in_reset_reset   (rst_controller_reset_out_reset),                            // cpu_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                 (cpu_data_master_address),                                   //                 cpu_data_master.address
		.cpu_data_master_waitrequest             (cpu_data_master_waitrequest),                               //                                .waitrequest
		.cpu_data_master_byteenable              (cpu_data_master_byteenable),                                //                                .byteenable
		.cpu_data_master_read                    (cpu_data_master_read),                                      //                                .read
		.cpu_data_master_readdata                (cpu_data_master_readdata),                                  //                                .readdata
		.cpu_data_master_write                   (cpu_data_master_write),                                     //                                .write
		.cpu_data_master_writedata               (cpu_data_master_writedata),                                 //                                .writedata
		.cpu_data_master_debugaccess             (cpu_data_master_debugaccess),                               //                                .debugaccess
		.cpu_instruction_master_address          (cpu_instruction_master_address),                            //          cpu_instruction_master.address
		.cpu_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                        //                                .waitrequest
		.cpu_instruction_master_read             (cpu_instruction_master_read),                               //                                .read
		.cpu_instruction_master_readdata         (cpu_instruction_master_readdata),                           //                                .readdata
		.BUTTON_pio_s1_address                   (mm_interconnect_0_button_pio_s1_address),                   //                   BUTTON_pio_s1.address
		.BUTTON_pio_s1_write                     (mm_interconnect_0_button_pio_s1_write),                     //                                .write
		.BUTTON_pio_s1_readdata                  (mm_interconnect_0_button_pio_s1_readdata),                  //                                .readdata
		.BUTTON_pio_s1_writedata                 (mm_interconnect_0_button_pio_s1_writedata),                 //                                .writedata
		.BUTTON_pio_s1_chipselect                (mm_interconnect_0_button_pio_s1_chipselect),                //                                .chipselect
		.cpu_debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),             //             cpu_debug_mem_slave.address
		.cpu_debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),               //                                .write
		.cpu_debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),                //                                .read
		.cpu_debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),            //                                .readdata
		.cpu_debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),           //                                .writedata
		.cpu_debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),          //                                .byteenable
		.cpu_debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),         //                                .waitrequest
		.cpu_debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),         //                                .debugaccess
		.high_res_timer_s1_address               (mm_interconnect_0_high_res_timer_s1_address),               //               high_res_timer_s1.address
		.high_res_timer_s1_write                 (mm_interconnect_0_high_res_timer_s1_write),                 //                                .write
		.high_res_timer_s1_readdata              (mm_interconnect_0_high_res_timer_s1_readdata),              //                                .readdata
		.high_res_timer_s1_writedata             (mm_interconnect_0_high_res_timer_s1_writedata),             //                                .writedata
		.high_res_timer_s1_chipselect            (mm_interconnect_0_high_res_timer_s1_chipselect),            //                                .chipselect
		.jtag_uart_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //     jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                .write
		.jtag_uart_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                .read
		.jtag_uart_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                .readdata
		.jtag_uart_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                .chipselect
		.LED_pio_s1_address                      (mm_interconnect_0_led_pio_s1_address),                      //                      LED_pio_s1.address
		.LED_pio_s1_write                        (mm_interconnect_0_led_pio_s1_write),                        //                                .write
		.LED_pio_s1_readdata                     (mm_interconnect_0_led_pio_s1_readdata),                     //                                .readdata
		.LED_pio_s1_writedata                    (mm_interconnect_0_led_pio_s1_writedata),                    //                                .writedata
		.LED_pio_s1_chipselect                   (mm_interconnect_0_led_pio_s1_chipselect),                   //                                .chipselect
		.onchip_memory_s1_address                (mm_interconnect_0_onchip_memory_s1_address),                //                onchip_memory_s1.address
		.onchip_memory_s1_write                  (mm_interconnect_0_onchip_memory_s1_write),                  //                                .write
		.onchip_memory_s1_readdata               (mm_interconnect_0_onchip_memory_s1_readdata),               //                                .readdata
		.onchip_memory_s1_writedata              (mm_interconnect_0_onchip_memory_s1_writedata),              //                                .writedata
		.onchip_memory_s1_byteenable             (mm_interconnect_0_onchip_memory_s1_byteenable),             //                                .byteenable
		.onchip_memory_s1_chipselect             (mm_interconnect_0_onchip_memory_s1_chipselect),             //                                .chipselect
		.onchip_memory_s1_clken                  (mm_interconnect_0_onchip_memory_s1_clken),                  //                                .clken
		.sdram_s1_address                        (mm_interconnect_0_sdram_s1_address),                        //                        sdram_s1.address
		.sdram_s1_write                          (mm_interconnect_0_sdram_s1_write),                          //                                .write
		.sdram_s1_read                           (mm_interconnect_0_sdram_s1_read),                           //                                .read
		.sdram_s1_readdata                       (mm_interconnect_0_sdram_s1_readdata),                       //                                .readdata
		.sdram_s1_writedata                      (mm_interconnect_0_sdram_s1_writedata),                      //                                .writedata
		.sdram_s1_byteenable                     (mm_interconnect_0_sdram_s1_byteenable),                     //                                .byteenable
		.sdram_s1_readdatavalid                  (mm_interconnect_0_sdram_s1_readdatavalid),                  //                                .readdatavalid
		.sdram_s1_waitrequest                    (mm_interconnect_0_sdram_s1_waitrequest),                    //                                .waitrequest
		.sdram_s1_chipselect                     (mm_interconnect_0_sdram_s1_chipselect)                      //                                .chipselect
	);

	Nios_System_2A_irq_mapper irq_mapper (
		.clk           (clocks_sys_clk_clk),             //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (cpu_debug_reset_request_reset),      // reset_in0.reset
		.clk            (clocks_sys_clk_clk),                 //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
