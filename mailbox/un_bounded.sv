///      MAIL BOX (UN_BOUNDED):-
///    Mailboxes provide thread-safe communication between processes
///    Unbounded mailboxes have no size limit

class packet;                               // class: define a class named 'packet'
                                            // packet: class name
  int a;                                    // Declare integer member variable 'a'
                                            // int: 32-bit signed integer type
endclass                                    // End of class definition
module sv;                                  // Declare a module named 'sv'
  packet p=new();                           // Declare handle 'p' and create packet object
                                            // packet: class type
                                            // p: handle name
                                            // new(): constructor creates a new packet object
  mailbox mbx=new();                        // mailbox: declare a mailbox
                                            // mbx: mailbox name
                                            // new(): constructor creates unbounded mailbox
                                            // Unbounded: can hold unlimited messages
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p.a=10;                               // Access member variable 'a' and assign value 10
                                            // p.a: dot notation to access class member
      mbx.put(p.a);                         // put(): method sends message to mailbox
                                            // mbx.put(p.a): puts value 10 into mailbox
                                            // put() is blocking: waits if mailbox is full (for bounded)
                                            // For unbounded: never blocks (always succeeds)
      $display("i am putting 1 key");     // $display: print message
                                            // Outputs: "i am putting 1 key"
    end                                     // End keyword: closes the sequential block
  initial                                   // Another initial block: runs in parallel
    begin                                   // Begin keyword: starts a sequential block
      mbx.get(p.a);                         // get(): method receives message from mailbox
                                            // mbx.get(p.a): gets value from mailbox and stores in p.a
                                            // get() is blocking: waits if mailbox is empty
                                            // Receives value 10 that was put by first initial block
      $display("i am getting 9 keys");    // $display: print message
                                            // Outputs: "i am getting 9 keys"
                                            // Note: Message says "9 keys" but only 1 was put/get
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration


 