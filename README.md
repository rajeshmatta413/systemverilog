# SystemVerilog Complete Learning Repository

**A Comprehensive Collection of SystemVerilog Concepts with Detailed Line-by-Line Explanations**

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [Fundamental Concepts](#1-fundamental-concepts)
3. [Arrays and Data Structures](#2-arrays-and-data-structures)
4. [Data Types](#3-data-types)
5. [Object-Oriented Programming](#4-object-oriented-programming)
6. [Constraints and Randomization](#5-constraints-and-randomization)
7. [Assertions](#6-assertions)
8. [Coverage](#7-coverage)
9. [Concurrency and Threading](#8-concurrency-and-threading)
10. [Synchronization Primitives](#9-synchronization-primitives)
11. [Advanced Control Flow](#10-advanced-control-flow)
12. [Interview Questions](#11-interview-questions)
13. [Repository Structure](#12-repository-structure)
14. [Getting Started](#13-getting-started)
15. [Best Practices](#14-best-practices)

---

## Introduction

This repository serves as a comprehensive learning resource for SystemVerilog, covering everything from fundamental concepts to advanced verification techniques. Each file contains detailed inline comments explaining every line of code, making it an ideal resource for both beginners and experienced engineers.

### Why This Repository?

- ✅ **Complete Coverage**: Every major SystemVerilog concept is demonstrated with working examples
- ✅ **Detailed Documentation**: Every line of code is explained with clear comments
- ✅ **Real-World Examples**: Practical examples including interview questions
- ✅ **Professional Structure**: Well-organized codebase following industry best practices
- ✅ **Learning Path**: From basics to advanced topics in logical progression

### What is SystemVerilog?

SystemVerilog is a hardware description and verification language that extends Verilog with features for:
- **Verification**: Constrained randomization, coverage, assertions
- **Object-Oriented Programming**: Classes, inheritance, polymorphism
- **Advanced Data Types**: Dynamic arrays, associative arrays, queues
- **Concurrency**: Fork-join blocks, threads, synchronization
- **Assertions**: Formal verification and property checking

---

## 1. Fundamental Concepts

### 1.1 Program Blocks
**File**: `program_block.sv`

**What are Program Blocks?**
Program blocks provide a clear separation between testbench code and design code. They execute in the reactive region, ensuring proper simulation semantics and avoiding race conditions between testbench and design.

**Key Features:**
- Execute in reactive region (after design code)
- Help avoid race conditions
- Better simulation control
- Clear separation of concerns

**When to Use:**
- Testbench development
- When you need to ensure testbench code runs after design code
- To avoid timing issues in simulation

**Example Usage:**
```systemverilog
program testbench;
  initial begin
    // Testbench code here
  end
endprogram
```

---

### 1.2 Packages
**File**: `packages.sv`

**What are Packages?**
Packages group related declarations (classes, functions, types, constants) together, providing a namespace mechanism. They enable code reusability and can be imported into modules, classes, or other packages.

**Key Features:**
- Namespace management
- Code reusability across multiple files
- Shared declarations
- Import mechanism: `import pkg::*` or `import pkg::item`

**Benefits:**
- Avoids naming conflicts
- Organizes related code
- Easy to share across projects
- Cleaner code structure

**Example Usage:**
```systemverilog
package my_pkg;
  class packet;
    // Class definition
  endclass
endpackage

import my_pkg::*;
module test;
  packet p = new();
endmodule
```

---

### 1.3 Scope Resolution Operator (::)
**File**: `scope_resolution_operator.sv`

**What is Scope Resolution?**
The `::` operator accesses static members and methods of a class without requiring an object instance. Static members belong to the class itself, not to any particular instance.

**Key Concepts:**
- Static members are shared across all instances
- Accessed using `class_name::member`
- No object instantiation needed
- Useful for constants and utility functions

**When to Use:**
- When you need class-level data (not instance-specific)
- For utility functions that don't need instance data
- For constants shared across all instances

**Example Usage:**
```systemverilog
class Counter;
  static int count = 0;
  static function void increment();
    count++;
  endfunction
endclass

Counter::increment();  // Access without object
```

---

### 1.4 Extern Keyword
**File**: `extern_keyword.sv`

**What is Extern?**
The `extern` keyword allows function/task definitions outside the class body. This keeps class declarations clean and separates interface from implementation.

**Key Features:**
- Declaration inside class, definition outside
- Cleaner class interfaces
- Better code organization
- Uses scope resolution: `function class_name::method_name()`

**Benefits:**
- Smaller class definitions
- Implementation can be in separate files
- Easier to read class interfaces
- Better for large classes

**Example Usage:**
```systemverilog
class Packet;
  extern function void display();
endclass

function Packet::display();
  $display("Packet data");
endfunction
```

---

### 1.5 For Loops
**File**: `for_loop.sv`

**What are Enhanced For Loops?**
SystemVerilog supports enhanced for loops with multiple initialization and increment statements, providing more flexibility than traditional loops.

**Key Features:**
- Multiple loop variables
- Multiple initialization statements
- Multiple increment/decrement operations
- Enhanced control flow

**Types:**
- Standard for loop: `for(int i=0; i<10; i++)`
- Multiple variables: `for(i=0,j=10; i<10; i++,j--)`

**When to Use:**
- Iterating through arrays
- Complex loop conditions
- Multiple related counters

**Example Usage:**
```systemverilog
for(int i=0, j=10; i<10; i++, j--) begin
  $display("i=%0d, j=%0d", i, j);
end
```

---

### 1.6 Data Type Conversions
**File**: `data_type_conversions.sv`

**What are Type Conversions?**
Type casting converts values from one data type to another using explicit casting syntax: `type'(expression)`. This ensures type safety and predictable behavior.

**Common Conversions:**
- `int'(real_value)`: Real to integer (truncates)
- `bit'(value)`: Any type to single bit (0 or 1)
- `byte'(value)`: Any type to 8-bit signed integer
- `real'(int_value)`: Integer to floating point

**When to Use:**
- When assigning between different types
- To ensure explicit conversion
- To avoid compilation warnings
- For type safety

**Example Usage:**
```systemverilog
real r = 2.99;
int i = int'(r);  // i = 2 (truncated)
```

---

### 1.7 Deep Copy vs Shallow Copy
**Files**: `deep_copy.sv`, `shallow_copy.sv`

**What are Copies?**
- **Deep Copy**: Creates completely independent copies; changes to copy don't affect original
- **Shallow Copy**: Copies handle reference; both point to same object (changes affect both)

**Deep Copy:**
- New object created
- All data copied
- Independent objects
- Use: `copy = new(); copy.field = original.field;`

**Shallow Copy:**
- Only handle copied
- Both point to same object
- Changes affect both
- Use: `copy = new original;`

**When to Use:**
- **Deep Copy**: When you need independent objects
- **Shallow Copy**: When you want shared references

**Example Usage:**
```systemverilog
// Deep copy
p2 = p1.copy();  // Independent object

// Shallow copy
p2 = new p1;  // Same object reference
```

---

## 2. Arrays and Data Structures

### 2.1 Fixed-Size Arrays
**Files**: 
- `arrays/one_dimentional_array.sv`
- `arrays/two_dimentional_array.sv`
- `arrays/three_dimentional_array.sv`
- `arrays/unpacked_array.sv`

**What are Fixed-Size Arrays?**
Arrays with a predetermined size that is fixed at compile time. Memory is allocated statically.

**One-Dimensional Arrays:**
- Syntax: `type name[size]`
- Example: `int arr[10]`
- Index range: 0 to size-1
- Direct access: `arr[index]`

**Two-Dimensional Arrays:**
- Syntax: `type name[rows][columns]`
- Example: `int matrix[4][4]`
- Access: `matrix[row][col]`
- Useful for matrices, tables

**Three-Dimensional Arrays:**
- Syntax: `type name[depth][rows][columns]`
- Example: `int cube[2][4][4]`
- Access: `cube[depth][row][col]`
- Useful for multi-dimensional data

**Unpacked Arrays:**
- Elements stored separately in memory
- More efficient for individual element access
- Standard array declaration

**When to Use:**
- Known size at compile time
- Memory efficiency important
- Direct indexing needed

**Example Usage:**
```systemverilog
int arr[5] = '{1,2,3,4,5};
int matrix[2][2] = '{'{1,2}, '{3,4}};
foreach(arr[i]) $display("arr[%0d]=%0d", i, arr[i]);
```

---

### 2.2 Dynamic Arrays
**File**: `arrays/dynamic_array.sv`

**What are Dynamic Arrays?**
Arrays with size that can be changed during simulation. Memory is allocated dynamically at runtime.

**Key Features:**
- Size not specified at declaration: `int arr[]`
- Allocated at runtime: `arr = new[size]`
- Can be resized: `arr = new[new_size]`
- Memory efficient for variable-sized data

**Methods:**
- `size()`: Returns current size
- `delete()`: Deallocates memory

**When to Use:**
- Size unknown at compile time
- Size changes during simulation
- Memory efficiency for sparse data

**Example Usage:**
```systemverilog
int arr[];
arr = new[10];      // Allocate 10 elements
arr = new[20];      // Resize to 20
arr.delete();       // Deallocate
```

---

### 2.3 Associative Arrays
**Files**: 
- `arrays/associative_array/integer_index.sv`
- `arrays/associative_array/string_index.sv`

**What are Associative Arrays?**
Sparse arrays using integer or string keys (like hash tables or dictionaries). Only occupied indices consume memory.

**Integer Index:**
- Syntax: `type name[*]`
- Example: `int arr[*]`
- Keys: Any integer value
- Ordered by key value

**String Index:**
- Syntax: `type name[string]`
- Example: `int arr[string]`
- Keys: String values
- Ordered lexicographically

**Methods:**
- `num()`: Number of entries
- `first(index)`: First key
- `last(index)`: Last key
- `next(index)`: Next key
- `prev(index)`: Previous key
- `delete()`: Remove all entries

**When to Use:**
- Sparse data (few entries)
- Non-contiguous indices
- Key-value pairs
- Memory efficiency

**Example Usage:**
```systemverilog
int arr[*];
arr[100] = 10;
arr[500] = 20;
foreach(arr[i]) $display("arr[%0d]=%0d", i, arr[i]);
```

---

### 2.4 Array Methods

#### Reduction Methods
**File**: `arrays/array_reduction_methods.sv`

Perform operations on all array elements, returning a single value.

**Methods:**
- `sum()`: Sum of all elements
- `product()`: Product of all elements
- `or()`, `and()`, `xor()`: Bitwise operations
- `sum() with (item*2)`: Transform before operation

**Example Usage:**
```systemverilog
int arr[5] = '{1,2,3,4,5};
int result = arr.sum();              // 15
result = arr.sum() with (item*2);    // 30
```

#### Ordering Methods
**File**: `arrays/array_ordering_methods.sv`

Rearrange array elements in place (modify original array).

**Methods:**
- `sort()`: Ascending order
- `rsort()`: Descending order
- `shuffle()`: Random order
- `reverse()`: Reverse order

**Example Usage:**
```systemverilog
int arr[5] = '{3,1,5,2,4};
arr.sort();      // {1,2,3,4,5}
arr.reverse();   // {5,4,3,2,1}
```

#### Locator Methods
**File**: `arrays/array_locator_or_finding_methods.sv`

Find elements matching criteria, returning a queue (doesn't modify original).

**Methods:**
- `min()`: Minimum value(s)
- `max()`: Maximum value(s)
- `find with (condition)`: All matching elements
- `find_first with (condition)`: First match
- `find_last with (condition)`: Last match
- `unique()`: Unique values only

**Example Usage:**
```systemverilog
int arr[5] = '{1,2,2,5,5};
int q[$];
q = arr.min();                    // {1}
q = arr.find with (item > 3);    // {5,5}
q = arr.unique();                 // {1,2,5}
```

---

### 2.5 Queues
**Files**: `queue/bounded_queue.sv`, `queue/unbounded_queue.sv`

**What are Queues?**
Dynamic data structures with FIFO/LIFO access, similar to linked lists but more efficient.

**Unbounded Queues:**
- Syntax: `type name[$]`
- No size limit
- Flexible size

**Bounded Queues:**
- Syntax: `type name[$:max_size]`
- Maximum size limit
- Error if exceeded

**Methods:**
- `push_front(value)`: Insert at front
- `push_back(value)`: Insert at back
- `pop_front()`: Remove front element
- `pop_back()`: Remove back element
- `insert(index, value)`: Insert at position
- `delete()`: Remove all elements
- `size()`: Current size

**When to Use:**
- FIFO/LIFO operations
- Dynamic size needed
- Efficient insertion/deletion

**Example Usage:**
```systemverilog
int q[$];
q.push_back(10);
q.push_front(5);
q.insert(1, 7);
int val = q.pop_front();
```

---

### 2.6 Strings
**File**: `string/string.sv`

**What are Strings?**
Dynamic character arrays with built-in manipulation methods.

**Key Methods:**
- `len()`: String length
- `toupper()`: Convert to uppercase
- `tolower()`: Convert to lowercase
- `putc(index, char)`: Replace character at index
- `getc(index)`: Get character at index
- `substr(start, end)`: Extract substring

**When to Use:**
- Text processing
- Message formatting
- String manipulation

**Example Usage:**
```systemverilog
string s = "Hello";
int len = s.len();              // 5
string upper = s.toupper();     // "HELLO"
s.putc(0, "h");                 // "hello"
```

---

## 3. Data Types

### 3.1 Enumerated Types
**File**: `datatypes/enum_datatype.sv`

**What are Enums?**
Named constants with automatic integer assignments (starting at 0). Makes code more readable.

**Key Features:**
- Readable code: `enum {red, blue, green} color`
- Automatic integer assignment: red=0, blue=1, green=2
- Type safety
- Methods: `first()`, `last()`, `next()`, `prev()`

**When to Use:**
- Finite set of values
- Readable code
- State machines
- Configuration options

**Example Usage:**
```systemverilog
enum {IDLE, RUN, STOP} state;
state = state.first();  // IDLE
state = state.next();   // RUN
```

---

### 3.2 Structures
**File**: `datatypes/struct_datatype.sv`

**What are Structures?**
Groups related variables together, accessed using dot notation.

**Key Features:**
- Member access: `struct_name.member`
- Literal assignment: `'{value1, value2, ...}`
- Packed and unpacked structures
- Memory layout control

**When to Use:**
- Grouping related data
- Packet structures
- Configuration structures
- Record-like data

**Example Usage:**
```systemverilog
struct {
  bit valid;
  int data;
  byte addr;
} packet;

packet = '{1, 100, 8'hFF};
```

---

### 3.3 Typedef
**File**: `datatypes/typedef_datatype.sv`

**What is Typedef?**
Creates type aliases for reusable type definitions.

**Key Features:**
- User-defined types
- Code readability
- Type reuse
- Consistent naming

**When to Use:**
- Complex type definitions
- Code reusability
- Clear type names
- Multiple uses of same type

**Example Usage:**
```systemverilog
typedef enum {RED, BLUE, GREEN} color_type;
color_type c1, c2;  // Both same type
```

---

## 4. Object-Oriented Programming

### 4.1 Classes and Objects
**File**: `oops_concepts/oops_concept.sv`

**What are Classes?**
Classes encapsulate data (member variables) and methods (functions/tasks) together.

**Key Concepts:**
- Class definition: `class class_name`
- Object creation: `handle = new()`
- Member access: `object.member`
- Encapsulation
- Data hiding

**Components:**
- Member variables: Data
- Methods: Functions and tasks
- Constructor: `new()`
- Handles: Object references

**When to Use:**
- Object-oriented design
- Encapsulation needed
- Code reusability
- Complex data structures

**Example Usage:**
```systemverilog
class Packet;
  int addr;
  int data;
  function void display();
    $display("addr=%0d, data=%0d", addr, data);
  endfunction
endclass

Packet p = new();
p.addr = 10;
p.display();
```

---

### 4.2 Inheritance
**File**: `oops_concepts/inheritance.sv`

**What is Inheritance?**
Child classes inherit all members (variables and methods) from parent classes.

**Key Features:**
- Syntax: `class child extends parent`
- Access to parent members
- Code reuse
- Hierarchical relationships

**Benefits:**
- Code reuse
- Consistent interface
- Polymorphism support
- Extensibility

**When to Use:**
- Related classes
- Shared functionality
- Hierarchical design
- Code reuse

**Example Usage:**
```systemverilog
class Parent;
  int addr;
  function void display();
    $display("Parent");
  endfunction
endclass

class Child extends Parent;
  // Inherits addr and display()
endclass
```

---

### 4.3 Polymorphism
**File**: `oops_concepts/polymorphism.sv`

**What is Polymorphism?**
Runtime method resolution based on object type. Parent handle can point to child object.

**Key Features:**
- `virtual` keyword enables polymorphism
- Parent handle pointing to child object
- Runtime binding
- Method overriding

**Requirements:**
- `virtual` keyword in parent method
- Method override in child
- Parent handle, child object

**When to Use:**
- Dynamic method selection
- Interface-based design
- Extensible systems
- Generic programming

**Example Usage:**
```systemverilog
class Parent;
  virtual function void display();
    $display("Parent");
  endfunction
endclass

class Child extends Parent;
  function void display();
    $display("Child");
  endfunction
endclass

Parent p;
Child c = new();
p = c;  // Polymorphism
p.display();  // Calls Child's display()
```

---

### 4.4 $cast
**File**: `oops_concepts/$cast.sv`

**What is $cast?**
Safe type conversion between related types (parent to child). Returns 1 on success, 0 on failure.

**Key Features:**
- Safe downcasting
- Type checking
- Error handling
- Returns success/failure

**When to Use:**
- Parent to child conversion
- Type safety needed
- Dynamic type checking
- Safe conversions

**Example Usage:**
```systemverilog
Parent p;
Child c = new();
p = c;
if ($cast(c, p)) begin
  // Safe conversion successful
  c.child_method();
end
```

---

### 4.5 Super Keyword
**File**: `oops_concepts/super_keyword.sv`

**What is Super?**
Accesses parent class members from child class. Explicitly calls parent methods.

**Key Features:**
- `super.method()`: Call parent method
- `super.variable`: Access parent variable
- Explicit parent access
- Override with parent call

**When to Use:**
- Extending parent functionality
- Calling parent from child
- Chaining constructors
- Partial overrides

**Example Usage:**
```systemverilog
class Child extends Parent;
  function void display();
    $display("Child");
    super.display();  // Call parent's display
  endfunction
endclass
```

---

### 4.6 This Keyword
**File**: `oops_concepts/this_keyword.sv`

**What is This?**
Refers to current object instance. Resolves name conflicts between parameters and members.

**Key Features:**
- `this.member`: Access member variable
- Resolve name conflicts
- Self-reference
- Clear member access

**When to Use:**
- Parameter shadows member
- Constructor parameters
- Clear member access
- Name conflict resolution

**Example Usage:**
```systemverilog
class Packet;
  int addr;
  function void set(int addr);
    this.addr = addr;  // Resolve conflict
  endfunction
endclass
```

---

### 4.7 Virtual Classes (Abstract Classes)
**File**: `oops_concepts/abstraction_or_virtual_class.sv`

**What are Virtual Classes?**
Cannot be instantiated directly. Must be extended by non-virtual classes. Serve as base templates.

**Key Features:**
- `virtual class` declaration
- Base class design
- Forced inheritance
- Template for derived classes

**When to Use:**
- Base class design
- Template classes
- Interface definition
- Forced inheritance

**Example Usage:**
```systemverilog
virtual class Base;
  // Base class definition
endclass

class Derived extends Base;
  // Must extend to use
endclass
```

---

## 5. Constraints and Randomization

### 5.1 Basic Constraints
**File**: `constraints/if_else_constraint.sv`

**What are Constraints?**
Constraints control randomization behavior, ensuring generated values meet specific requirements.

**If-Else Constraints:**
- Conditional constraint application
- Dynamic constraint selection
- Based on conditions

**When to Use:**
- Conditional value assignment
- Dynamic constraints
- Complex constraint logic

**Example Usage:**
```systemverilog
constraint c1 {
  if (mode == 0)
    data inside {[0:10]};
  else
    data inside {[20:30]};
}
```

---

### 5.2 Inside Constraint
**File**: `constraints/inside_constraint.sv`

**What is Inside Constraint?**
Restricts values to specified ranges or sets.

**Key Features:**
- Syntax: `variable inside {range1, range2, ...}`
- Multiple valid ranges
- Set-based constraints
- Inclusive ranges

**When to Use:**
- Specific value ranges
- Multiple valid sets
- Range restrictions

**Example Usage:**
```systemverilog
constraint c1 {
  data inside {[10:20], [30:40]};
}
```

---

### 5.3 Distribution Constraint
**File**: `constraints/distribution_constraint.sv`

**What is Distribution Constraint?**
Assigns probability weights to value ranges.

**Key Features:**
- `dist` keyword
- Weight assignment: `:=` (equal), `:/` (distributed)
- Probability control
- Weighted randomization

**When to Use:**
- Weighted randomization
- Probability control
- Biased distributions

**Example Usage:**
```systemverilog
constraint c1 {
  data dist {[0:10] := 5, [20:30] := 10};
}
```

---

### 5.4 Unique Constraint
**File**: `constraints/unique_constraint.sv`

**What is Unique Constraint?**
Ensures all values in a set are different.

**Key Features:**
- `unique {variable1, variable2, ...}`
- No duplicate values
- Array element uniqueness

**When to Use:**
- Unique values needed
- No duplicates
- Array uniqueness

**Example Usage:**
```systemverilog
constraint c1 {
  unique {arr};
}
```

---

### 5.5 Soft Constraint
**File**: `constraints/soft_constraint.sv`

**What is Soft Constraint?**
Constraints that can be violated if hard constraints conflict. Hard constraints take precedence.

**Key Features:**
- `soft` keyword
- Can be violated
- Hard constraints win
- Flexible constraint resolution

**When to Use:**
- Preferred values
- Flexible constraints
- Constraint conflicts
- Fallback values

**Example Usage:**
```systemverilog
constraint c1 {
  soft data inside {[0:10]};
}
constraint c2 {
  data inside {[20:30]};  // Hard - takes precedence
}
```

---

### 5.6 Inline Constraint
**File**: `constraints/inline_constraint.sv`

**What are Inline Constraints?**
Constraints specified directly in `randomize()` call, temporarily overriding class constraints.

**Key Features:**
- Temporary constraint application
- Override class constraints
- Dynamic constraint modification
- Per-call constraints

**When to Use:**
- One-time constraint changes
- Dynamic constraints
- Override class constraints
- Test-specific constraints

**Example Usage:**
```systemverilog
p.randomize() with {data > 100;};
```

---

### 5.7 Additional Constraint Examples
- **`constraint_out_of_the_class.sv`**: Constraints defined outside class
- **`inheritance_in_constraint.sv`**: Constraints in inherited classes
- **`solve_a_before_b_constraint.sv`**: Constraint ordering
- **`no_is_divided_by_4.sv`**: Mathematical constraints
- **`fibonacci_series_by_using_constraint.sv`**: Complex pattern constraints

---

### 5.8 Randomization

#### Rand vs Randc
**Files**: `randomization/repeat.sv`, `randomization/without_repeat.sv`

**Rand:**
- Generates new random value each time
- May repeat values
- Standard randomization

**Randc:**
- Cyclic randomization
- All values before repeating
- Better coverage

**Example Usage:**
```systemverilog
class Packet;
  rand bit[4:0] a;   // May repeat
  randc bit[4:0] b;  // No repeats until all seen
endclass
```

#### Randomization Methods
**Files**: 
- `randomization/by_using_range_method.sv`
- `randomization/different_modes.sv`
- `randomization/without_using_rand.sv`

**Methods:**
- `randomize()`: Standard randomization
- `randomize() with {...}`: Inline constraints
- `$urandom_range(min, max)`: Random range

---

## 6. Assertions

### 6.1 Immediate Assertions
**File**: `assertions/immidiate_assertion.sv`

**What are Immediate Assertions?**
Execute immediately when encountered (not clocked). Check conditions at current simulation time.

**Key Features:**
- `assert (condition)`
- Pass/fail blocks
- Event control: `@(posedge clk)`
- Immediate evaluation

**When to Use:**
- Combinational checks
- Immediate verification
- Non-clock-based checks

**Example Usage:**
```systemverilog
@(posedge clk) assert (a && b)
  $display("Pass");
else
  $display("Fail");
```

---

### 6.2 Sequence Assertions
**File**: `assertions/sequence_assertion.sv`

**What are Sequence Assertions?**
Check temporal properties over multiple clock cycles using sequences and properties.

**Key Features:**
- `sequence`: Temporal patterns
- `property`: Property definitions
- `assert property`: Concurrent assertions
- Clock-based evaluation

**When to Use:**
- Temporal checks
- Multi-cycle properties
- Design verification
- Formal verification

**Example Usage:**
```systemverilog
sequence seq1;
  @(posedge clk) (a && b);
endsequence

property prop1;
  seq1;
endproperty

assert property (prop1);
```

---

## 7. Coverage

### 7.1 Basic Coverage
**File**: `coverages/coverage.sv`

**What is Coverage?**
Tracks simulation coverage of design features to ensure thorough testing.

**Key Concepts:**
- `covergroup`: Coverage group definition
- `coverpoint`: Variable being covered
- `bins`: Coverage bins
- `sample()`: Sample coverage data

**Bin Types:**
- **Fixed bins**: `bins name = {value}`
- **Array bins**: `bins name[] = {value1, value2, ...}`
- **Range bins**: `bins name[] = {[min:max]}`
- **Wildcard bins**: `wildcard bins name = {pattern}`
- **Transition bins**: `bins name[] = (value1 => value2)`
- **Default bins**: `bins name[] = default`
- **Ignore bins**: `ignore_bins name = {values}`
- **Illegal bins**: `illegal_bins name = {values}`

**Example Usage:**
```systemverilog
covergroup cg;
  c1: coverpoint data {
    bins b[4] = {1,2,3,4};
    bins c[] = {[10:20]};
  }
endgroup
```

---

### 7.2 Cross Coverage
**File**: `coverages/cross_coverage.sv`

**What is Cross Coverage?**
Coverage between multiple variables to check combinations.

**Key Features:**
- `cross`: Cross coverage between coverpoints
- Combination coverage
- Multi-dimensional coverage

**When to Use:**
- Combination testing
- Multi-variable coverage
- Interaction coverage

---

### 7.3 Coverage with Clause
**File**: `coverages/with_clause.sv`

**What is With Clause?**
Conditional coverage bins using `with` clause.

**Key Features:**
- `with (condition)`: Filter coverage
- Conditional binning
- Selective coverage

---

## 8. Concurrency and Threading

### 8.1 Fork-Join
**File**: `fork_joins_or_threads/join_or_join_all.sv`

**What is Fork-Join?**
All threads execute concurrently; parent waits for all to complete.

**Key Features:**
- `fork ... join`: Wait for all threads
- Concurrent execution
- Synchronization point

**When to Use:**
- Parallel execution
- Synchronization needed
- All threads must complete

**Example Usage:**
```systemverilog
fork
  begin
    #10 $display("Thread 1");
  end
  begin
    #20 $display("Thread 2");
  end
join  // Wait for both
```

---

### 8.2 Fork-Join Any
**File**: `fork_joins_or_threads/join_any.sv`

**What is Join Any?**
Parent continues after first thread completes.

**Key Features:**
- `fork ... join_any`: Wait for any thread
- Early continuation
- Background execution

**When to Use:**
- Race conditions
- First-to-complete logic
- Background threads

---

### 8.3 Fork-Join None
**File**: `fork_joins_or_threads/join_none.sv`

**What is Join None?**
Parent continues immediately; threads run in background.

**Key Features:**
- `fork ... join_none`: No waiting
- Fire-and-forget threads
- Background processing

**When to Use:**
- Background tasks
- Fire-and-forget
- Independent threads

---

### 8.4 Wait Fork
**File**: `fork_joins_or_threads/wait_fork.sv`

**What is Wait Fork?**
Waits for all child threads to complete.

**Key Features:**
- `wait fork`: System task
- Thread synchronization
- Complete all spawned threads

**When to Use:**
- Final synchronization
- Wait for all threads
- Cleanup before exit

---

### 8.5 Disable Fork
**File**: `fork_joins_or_threads/disable_fork.sv`

**What is Disable Fork?**
Terminates all child threads spawned by fork-join.

**Key Features:**
- `disable fork`: System task
- Thread termination
- Cleanup mechanism

**When to Use:**
- Error handling
- Thread cleanup
- Termination needed

---

## 9. Synchronization Primitives

### 9.1 Mailboxes
**Files**: `mailbox/bounded.sv`, `mailbox/un_bounded.sv`

**What are Mailboxes?**
Thread-safe communication channels between processes.

**Bounded Mailboxes:**
- Fixed capacity
- `put()` blocks when full
- Memory efficient

**Unbounded Mailboxes:**
- Unlimited capacity
- Never blocks on put
- Flexible size

**Methods:**
- `put(message)`: Send message (blocking)
- `get(message)`: Receive message (blocking)
- `try_put()`, `try_get()`: Non-blocking versions
- `num()`: Number of messages

**When to Use:**
- Inter-process communication
- Producer-consumer patterns
- Thread synchronization
- Message passing

**Example Usage:**
```systemverilog
mailbox mbx = new();
mbx.put(data);  // Send
mbx.get(data);  // Receive
```

---

### 9.2 Semaphores
**Files**: `semaphore/sema.sv`, `semaphore/sema_by_using_fork_join.sv`

**What are Semaphores?**
Resource counting and mutual exclusion for access control.

**Key Features:**
- `new(count)`: Create with initial keys
- `put(count)`: Return keys (non-blocking)
- `get(count)`: Acquire keys (blocking)
- Resource access control

**When to Use:**
- Resource sharing
- Access control
- Mutual exclusion
- Thread synchronization

**Example Usage:**
```systemverilog
semaphore sema = new(4);  // 4 keys
sema.get(1);  // Acquire 1 key
// Critical section
sema.put(1);  // Return key
```

---

## 10. Advanced Control Flow

### 10.1 Priority If
**File**: `if_conditions/priority_if.sv`

**What is Priority If?**
Ensures at least one branch executes; error if all conditions false.

**Key Features:**
- `priority if`: Enforced execution
- Simulation error on all false
- Guaranteed branch execution

**When to Use:**
- Must have one branch
- Error detection
- Required execution

---

### 10.2 Unique If
**File**: `if_conditions/unique_if.sv`

**What is Unique If?**
Ensures exactly one branch executes; error if multiple conditions true.

**Key Features:**
- `unique if`: Mutually exclusive branches
- Simulation error on multiple true
- Exclusive execution guarantee

**When to Use:**
- Mutually exclusive conditions
- One-hot logic
- Error detection

---

## 11. Interview Questions

The repository includes practical interview questions covering various SystemVerilog concepts:

### Pattern Generation
**Location**: `interview_questions/pattern_generation/`
- Various pattern generation examples
- Practical coding problems

### System Functions
**Locations**: 
- `interview_questions/$countones/`: Count ones in a vector
- `interview_questions/$onehot/`: Check one-hot encoding

### Constraint-Based Problems
**Locations**:
- `interview_questions/implication_constraint/`: Implication operator usage
- `interview_questions/inside_constraint/`: Inside constraint applications

### Complex Problems
**Location**: `interview_questions/chess_board/`: Chess board-related problems

---

## 12. Repository Structure

```
System Verilog/
├── arrays/                          # Array types and methods
│   ├── associative_array/          # Associative arrays
│   │   ├── integer_index.sv
│   │   └── string_index.sv
│   ├── array_locator_or_finding_methods.sv
│   ├── array_ordering_methods.sv
│   ├── array_reduction_methods.sv
│   ├── dynamic_array.sv
│   ├── one_dimentional_array.sv
│   ├── three_dimentional_array.sv
│   ├── two_dimentional_array.sv
│   └── unpacked_array.sv
├── assertions/                      # Assertion examples
│   ├── immidiate_assertion.sv
│   └── sequence_assertion.sv
├── constraints/                      # Constraint examples
│   ├── constraint_out_of_the_class.sv
│   ├── distribution_constraint.sv
│   ├── fibonacci_series_by_using_constraint.sv
│   ├── if_else_constraint.sv
│   ├── inheritance_in_constraint.sv
│   ├── inline_constraint.sv
│   ├── inside_constraint.sv
│   ├── no_is_divided_by_4.sv
│   ├── soft_constraint.sv
│   ├── solve_a_before_b_constraint.sv
│   └── unique_constraint.sv
├── coverages/                        # Coverage examples
│   ├── coverage.sv
│   ├── cross_coverage.sv
│   └── with_clause.sv
├── datatypes/                        # Data type examples
│   ├── enum_datatype.sv
│   ├── struct_datatype.sv
│   └── typedef_datatype.sv
├── fork_joins_or_threads/           # Concurrency examples
│   ├── disable_fork.sv
│   ├── join_any.sv
│   ├── join_none.sv
│   ├── join_or_join_all.sv
│   └── wait_fork.sv
├── if_conditions/                    # Conditional statements
│   ├── priority_if.sv
│   └── unique_if.sv
├── interview_questions/              # Interview problems
│   ├── $countones/
│   ├── $onehot/
│   ├── chess_board/
│   ├── implication_constraint/
│   ├── inside_constraint/
│   └── pattern_generation/
├── mailbox/                          # Mailbox examples
│   ├── bounded.sv
│   └── un_bounded.sv
├── oops_concepts/                    # OOP examples
│   ├── $cast.sv
│   ├── abstraction_or_virtual_class.sv
│   ├── inheritance.sv
│   ├── oops_concept.sv
│   ├── polymorphism.sv
│   ├── super_keyword.sv
│   └── this_keyword.sv
├── queue/                            # Queue examples
│   ├── bounded_queue.sv
│   └── unbounded_queue.sv
├── randomization/                    # Randomization examples
│   ├── by_using_range_method.sv
│   ├── different_modes.sv
│   ├── repeat.sv
│   ├── without_repeat.sv
│   └── without_using_rand.sv
├── semaphore/                        # Semaphore examples
│   ├── sema_by_using_fork_join.sv
│   └── sema.sv
├── string/                           # String examples
│   └── string.sv
├── data_type_conversions.sv          # Type conversion examples
├── deep_copy.sv                      # Deep copy example
├── extern_keyword.sv                 # Extern keyword example
├── for_loop.sv                       # For loop examples
├── packages.sv                       # Package example
├── program_block.sv                 # Program block example
├── scope_resolution_operator.sv      # Scope resolution example
└── shallow_copy.sv                   # Shallow copy example
```

---

## 13. Getting Started

### Prerequisites

- **SystemVerilog Simulator**: ModelSim, QuestaSim, VCS, Xcelium, or any IEEE 1800 compliant simulator
- **Basic Knowledge**: Understanding of Verilog/SystemVerilog syntax
- **Text Editor**: Any text editor or IDE (VS Code, Vim, etc.)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/systemverilog.git
   cd systemverilog
   ```

2. **Compile a file** (Example with ModelSim/QuestaSim):
   ```bash
   vlog program_block.sv
   ```

3. **Run simulation**:
   ```bash
   vsim -c program_block -do "run -all; quit"
   ```

4. **View waveforms** (if VCD file generated):
   ```bash
   vsim program_block
   # Add signals to waveform viewer
   ```

### Learning Path

#### Beginner Level
1. Start with fundamental concepts:
   - `program_block.sv` - Program blocks
   - `packages.sv` - Packages
   - `for_loop.sv` - Loops
   - `arrays/one_dimentional_array.sv` - Basic arrays

2. Move to data types:
   - `datatypes/enum_datatype.sv` - Enumerated types
   - `datatypes/struct_datatype.sv` - Structures
   - `string/string.sv` - Strings

#### Intermediate Level
1. Object-Oriented Programming:
   - `oops_concepts/oops_concept.sv` - Classes
   - `oops_concepts/inheritance.sv` - Inheritance
   - `oops_concepts/polymorphism.sv` - Polymorphism

2. Arrays and Data Structures:
   - `arrays/dynamic_array.sv` - Dynamic arrays
   - `arrays/associative_array/` - Associative arrays
   - `queue/unbounded_queue.sv` - Queues

3. Constraints:
   - `constraints/inside_constraint.sv` - Basic constraints
   - `constraints/if_else_constraint.sv` - Conditional constraints
   - `randomization/repeat.sv` - Randomization

#### Advanced Level
1. Assertions and Coverage:
   - `assertions/sequence_assertion.sv` - Sequence assertions
   - `coverages/coverage.sv` - Coverage groups

2. Concurrency:
   - `fork_joins_or_threads/join_or_join_all.sv` - Fork-join
   - `mailbox/bounded.sv` - Mailboxes
   - `semaphore/sema.sv` - Semaphores

3. Interview Questions:
   - Practice with problems in `interview_questions/`

---

## 14. Best Practices

### Code Organization
- ✅ Use packages for shared code
- ✅ Separate classes into logical files
- ✅ Use meaningful names
- ✅ Group related functionality

### Documentation
- ✅ Comment complex logic
- ✅ Explain constraints clearly
- ✅ Document function parameters
- ✅ Note important assumptions

### Constraints
- ✅ Use meaningful constraint names
- ✅ Keep constraints simple when possible
- ✅ Use soft constraints for preferences
- ✅ Test constraint conflicts

### OOP Design
- ✅ Use virtual functions for polymorphism
- ✅ Encapsulate data properly
- ✅ Use inheritance appropriately
- ✅ Follow SOLID principles

### Performance
- ✅ Use appropriate data structures
- ✅ Avoid unnecessary randomization
- ✅ Optimize coverage bins
- ✅ Consider memory usage

---

## Additional Resources

- **IEEE SystemVerilog Standard**: IEEE 1800
- **Verification Academy**: https://verificationacademy.com/
- **SystemVerilog LRM**: Language Reference Manual
- **Community Forums**: Stack Overflow, Verification Guild

---

## Contributing

Contributions are welcome! Please ensure:
- All code includes detailed comments
- Examples are clear and well-documented
- Code follows SystemVerilog best practices
- Files are properly organized
- Test cases are included where applicable

---

## License

This repository is for educational purposes. Feel free to use and modify the code for learning.

---

## Author

**Rajesh Matta**

A comprehensive SystemVerilog learning resource with detailed explanations and examples.

---

## Acknowledgments

This repository serves as a learning resource for SystemVerilog concepts commonly used in verification and design. All examples are carefully documented with line-by-line explanations to facilitate understanding.

---

**Happy Learning! 🚀**

For questions, suggestions, or contributions, please open an issue or submit a pull request.

---

*Last Updated: [Current Date]*

*Repository Version: 1.0*
