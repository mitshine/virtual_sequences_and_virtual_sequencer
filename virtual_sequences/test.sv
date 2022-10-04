// Base Test Class
class base_test extends uvm_test;
 `uvm_component_utils(base_test);

 // Environment Class Instantiation
 top_env Env;

 // Constructor
 function new (string name = "base_test", uvm_component parent = null);
   super.new(name, parent);
 endfunction: new

 // Build Phase
 function void build_phase (uvm_phase phase);
   Env = top_env::type_id::create("Env");
 endfunction: build_phase

 // Method to Connect Sequencer Handles in VSEQ
 function void init_vseq (base_vseq vseq);
   vseq.SQR_AHB = test.env.ahb_agent.SQR_AHB;
   vseq.SQR_AXI = test.env.axi_agent.SQR_AXI;
 endfunction: init_vseq

endclass: base_test

// In the test base class i.e. base_test, shown UVM code above, a method i.e. init_vseq() is created which is used to assign the sequencer handles to the handles in classes derived from the virtual sequence base class.
// Main Test
class test extends base_test;
 `uvm_component_utils(test)

 // Constructor
 function new (string name = "test", uvm_component parent = null);
 super.new(name, parent);
 endfunction: new

 // Run Phase
 task run_phase (uvm_phase phase);
   // Create the Virtual Sequence
   my_vseq vseq = my_vseq::type_id::create("vseq");
   phase.raise_objection(this);
   // Virtual Sequence Initialization
   init_vseq(vseq);
   // Start the Virtual Sequence
   vseq.start(null);
   phase.drop_objection(this);
  endtask: run_phase
 
endclass: test
