// Virtual Sequencer Class
class virtual_seqr extend uvm_sequencer;
 `uvm_component_utils(virtual_seqr)

 // Target Sequencer Handles
  ahb_seqr SQR_AHB;
  axi_seqr SQR_AXI;

 // Constructor
 function new (string name = "virtual_seqr", uvm_component parent);
  super.new(name, parent);
 endfunction: new

endclass: virtual_seqr
