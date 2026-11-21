class generator;

    transaction trans;
    mailbox gen2driv;

    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction

    task main();
        // Generate eight transactions for the eight possible input combinations.
        // Inputs are randomized; this does not guarantee all eight combinations occur.
        repeat(8)
        begin
            trans = new();
            if (!trans.randomize())
                $fatal(1, "Transaction randomization failed");

            trans.display("Generator");
            gen2driv.put(trans);
        end
    endtask

endclass
