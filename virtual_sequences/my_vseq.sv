// Base Virtual Sequence Class
class base_vseq extends uvm_sequence #(uvm_sequence_item);
 `uvm_object_utils(base_vseq)

// Target Agent Sequencers
uvm_sequencer #(ahb_txn) SQR_AHB;
 uvm_sequencer #(axi_txn) SQR_AXI;

 // Constructor
 function new (string name = "base_vseq");
   super.new(name);
 endfunction: new

endclass: vseq_base

// Virtual Sequence Class
class my_vseq extends base_vseq;
 `uvm_object_utils(my_vseq)

 // Constructor
 function new (string name = "my_vseq");
   super.new(name);
 endfunction: new

 // Sequence Body Task
 task body();

   ahb_seqeunce ahb_seq;
   axi_sequence axi_seq;

   ahb_seq = ahb_sequence::type_id::create("ahb_seq");
   axi_seq = axi_sequence::type_id::create("axi_seq");

   fork
    abh_seq.start(SQR_AHB);
    axi_seq.start(SQR_AXI);
   join

endclass: my_vseq
