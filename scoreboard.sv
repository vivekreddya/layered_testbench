class scoreboard;

    mailbox mon2scb;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task main;
        transaction trans;
        bit expected_sum;
        bit expected_carry;

        repeat(8)
        begin
            mon2scb.get(trans);

            expected_sum   = trans.a ^ trans.b ^ trans.cin;
            expected_carry = (trans.a & trans.b) |
                             (trans.b & trans.cin) |
                             (trans.a & trans.cin);

            if ((expected_sum == trans.sum) &&
                (expected_carry == trans.carry))
                $display("PASS: Result is as Expected");
            else
                $error("FAIL: Wrong Result. Expected sum=%0b carry=%0b, Got sum=%0b carry=%0b",
                       expected_sum, expected_carry, trans.sum, trans.carry);

            trans.display("Scoreboard");
        end
    endtask

endclass
