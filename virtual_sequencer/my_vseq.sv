// Base Virtual Sequence
class base_vseq extends uvm_sequence #(uvm_sequence_item);
 `uvm_object_utils(base_vseq)

 // Virtual Sequencer Handle
 virtual_seqr v_sqr;

 // Target Sequencers Handle
 ahb_seqr SQR_AHB;
 axi_seqr SQR_AXI;

 // Constructor
 function new (string name = "base_vseq");
  super.new(name);
 endfunction: new

 // Body Task (Assign target sequencers handle)
 task body();
  if (!$cast(v_sqr, m_sequencer)) begin
   `uvm_error(get_full_name(), "Virtual Seqr pointer cast failed")
  end
  SQR_AHB = v_sqr.SQR_AHB;
  SQR_AXI = v_sqr.SQR_AXI;
 endtask: body

endclass: base_vseq

// Virtual Sequence
class my_vseq extends base_vseq;
 `uvm_object_utils(my_vseq)

 // Constructor
 function new (string name = "my_vseq");
  super.new(name);
 endfunction: new

 // Body Task(starting the sub-sequences)
 task body();

  // Assigning the Sub-Sequencer Handles
  super.body;
  // Sub-Sequence Creation & Execution
  ahb_sequence ahb_seq;
  axi_sequence axi_seq;

  ahb_seq = ahb_sequence::type_id::create("ahb_seq");
  axi_seq = axi_sequence::type_id::create("axi_seq");

  repeat(30) begin
   ahb_seq.start(SQR_AHB);
   axi_seq.start(SQR_AXI);
  end

 endtask: body

endclass: my_vseq
