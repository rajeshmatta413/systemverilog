///  MAIL BOX (BOUNDED):-
///    Mailboxes provide thread-safe communication between processes
///    Bounded mailboxes have a maximum capacity

module sv;                                  // Declare a module named 'sv'
  int addr;                                 // Declare integer variable 'addr' (address)
                                            // int: 32-bit signed integer type
  mailbox mbx=new();                        // mailbox: declare a mailbox
                                            // mbx: mailbox name
                                            // new(): constructor creates mailbox
                                            // new(): default constructor creates unbounded mailbox
                                            // Note: This creates unbounded mailbox despite comment
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      addr=10;                              // Assignment: assign value 10 to variable addr
      mbx.put(addr);                        // put(): method sends message to mailbox
                                            // mbx.put(addr): puts value 10 into mailbox
                                            // put() is blocking: waits if mailbox is full (for bounded)
      $display("i am putting 1 key");      // $display: print message
                                            // Outputs: "i am putting 1 key"
    end                                     // End keyword: closes the sequential block
  initial                                   // Another initial block: runs in parallel
    begin                                   // Begin keyword: starts a sequential block
      mbx.get(addr);                        // get(): method receives message from mailbox
                                            // mbx.get(addr): gets value from mailbox and stores in addr
                                            // get() is blocking: waits if mailbox is empty
                                            // Receives value 10 that was put by first initial block
      $display("i am getting 9 keys");    // $display: print message
                                            // Outputs: "i am getting 9 keys"
                                            // Note: Message says "9 keys" but only 1 was put/get
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
