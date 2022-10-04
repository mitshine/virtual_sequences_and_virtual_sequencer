class Test extends uvm_test;
 `uvm_component_utils(Test)

 // Instantiations
 my_vseq vseq;
 Environment Env;
 // Constructor
 function new (string name = "Test", uvm_component parent = null);
  super.new(name, parent);
 endfunction: new

 // Build Phase
function void build_phase (uvm_phase phase);
   Env  = Environ::type_id::create("Env");
endfunction: build_phase

 // Run Phase
 task run_phase (uvm_phase phase);
   // Create the Virtual Sequence & Environment
   vseq = my_vseq::type_id::create("vseq");
   phase.raise_objection(this);
   // Start the Virtual Sequence
   vseq.start(Env.v_sqr);
   phase.drop_objection(this);
 endtask: run_phase

endclass: Test
