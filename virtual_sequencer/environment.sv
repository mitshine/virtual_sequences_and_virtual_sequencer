class Environment extends uvm_env;
 `uvm_component_utils(Environ)

 // Virtual Sequencer Handle
 virtual_seqr v_sqr;

 // Agents Handles
 ahb_agent AHB_AGNT;
 axi_agent AXI_AGNT;

 // Constructor
 function new (string name = "Environ", uvm_component parent);
  super.new(name, parent);
 endfunction: new

 // Build Phase
 function void build_phase (uvm_phase phase);
  v_sqr = virtual_seqr::type_id::create("v_sqr");
  AHB_AGNT = ahb_agent::type_id::create("AHB_AGNT");
  AXI_AGNT = axi_agent::type_id::create("AXI_AGNT");
 endfunction: build_phase

 // Connect Phase
 function void connect_phase (uvm_phase phase);
  v_sqr.SQR_AHB = AHB_AGNT.m_sequencer;
  v_sqr.SQR_AXI = AXI_AGNT.m_sequencer;
 endfunction: connect_phase

endclass: Environment
