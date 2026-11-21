class monitor;

    virtual intf vif;
    mailbox mon2scb;

    function new(virtual intf vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task main;
        repeat(8)
        begin
            transaction trans;
            #3;

            trans = new();
            trans.a     = vif.a;
            trans.b     = vif.b;
            trans.cin   = vif.cin;
            trans.sum   = vif.sum;
            trans.carry = vif.carry;

            trans.display("Monitor");
            mon2scb.put(trans);
        end
    endtask

endclass
