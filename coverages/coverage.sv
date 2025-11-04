///    COVERAGE:-
///    Coverage groups track simulation coverage of design features
///    Various bin types capture different coverage scenarios

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit [5:0]data;                       // rand: keyword makes variable randomizable
                                            // bit [5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
endclass                                    // End of class definition
module sv;                                  // Declare a module named 'sv'
  packet p=new();                           // Declare handle 'p' and create packet object in one line
                                            // packet: class type
                                            // p: handle name
                                            // new(): constructor creates a new packet object
  covergroup cg;                            // covergroup: define a coverage group
                                            // cg: coverage group name
                                            // Coverage group: tracks coverage of design features
    option.per_instance=1;                  // option: coverage group option
                                            // per_instance=1: track coverage per instance separately
                                            // Each instance of coverage group has separate coverage
    c1:coverpoint p.data{                   // coverpoint: define a coverage point
                                            // c1: coverpoint name
                                            // p.data: variable being covered (data member)
      bins b[4]={1,2,3,4};                 // bins: define coverage bins
                                            // b[4]: array of 4 bins (b[0], b[1], b[2], b[3])
                                            // {1,2,3,4}: values assigned to bins
                                            // b[0]=1, b[1]=2, b[2]=3, b[3]=4
      bins c[]={9,6,7};                    // bins: define individual bins for each value
                                            // c[]: array of bins (auto-sized)
                                            // {9,6,7}: creates bins c[0]=9, c[1]=6, c[2]=7
      bins d[]=(1=>2);                     // bins: define transition bins
                                            // d[]: array of bins for transitions
                                            // (1=>2): transition from value 1 to value 2
                                            // Tracks consecutive occurrences of 1 followed by 2
      bins y0={8};                          // bins: define single bin
                                            // y0: bin name
                                            // {8}: bin contains value 8
      bins y1={5};                          // bins: define single bin
                                            // y1: bin name
                                            // {5}: bin contains value 5
      bins p[]=default;                     // bins: define default bins
                                            // p[]: array of bins for default values
                                            // default: catches all values not explicitly binned
                                            // Values not in other bins go to default bins
      wildcard bins a[5]={4'b1???};        // wildcard bins: define bins with wildcards
                                            // a[5]: array of 5 bins
                                            // {4'b1???}: wildcard pattern (4-bit binary)
                                            // 1??? matches: 1000, 1001, 1010, 1011, 1100, etc.
                                            // ?: wildcard matches 0 or 1
      bins q[]={[20:$]};                   // bins: define range bins
                                            // q[]: array of bins for range
                                            // {[20:$]}: range from 20 to maximum ($)
                                            // $: maximum value (63 for 6-bit)
                                            // Covers values 20 to 63
      ignore_bins w[3]={32,33,34};         // ignore_bins: bins to ignore in coverage
                                            // w[3]: array of 3 ignore bins
                                            // {32,33,34}: values to ignore (not counted in coverage)
                                            // These values don't contribute to coverage percentage
      illegal_bins e[2]={21,22};           // illegal_bins: bins that indicate errors
                                            // e[2]: array of 2 illegal bins
                                            // {21,22}: values that should never occur
                                            // If these values occur, coverage reports error
      
    }                                       // End of coverpoint definition
    endgroup                                // End of coverage group definition
      initial                               // Initial block: executes once at simulation start
        begin                               // Begin keyword: starts a sequential block
          cg cg_inst;                       // Declare coverage group instance
                                            // cg: coverage group type
                                            // cg_inst: instance name
          cg_inst=new();                    // new(): create coverage group instance
                                            // cg_inst.new(): creates instance of coverage group
                                            // Initializes coverage tracking
          repeat(20)                        // repeat: loop construct that repeats specified number of times
                                            // repeat(20): execute loop body 20 times
            begin                           // Begin keyword: starts loop body
              p.randomize();                // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Generates random value for data
              cg_inst.sample();             // sample(): method samples coverage data
                                            // cg_inst.sample(): samples current values for coverage
                                            // Updates coverage bins based on current p.data value
              $display("data=%0d",p.data); // $display: print randomized data value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
            end                             // End keyword: closes loop body
        end                                 // End keyword: closes the sequential block
endmodule                                   // End of module declaration
      
 