# SystemVerilog Learning Repository

A comprehensive collection of SystemVerilog concepts, examples, and interview questions with detailed line-by-line comments. This repository serves as a complete reference guide for SystemVerilog programming, covering fundamental concepts to advanced topics.

## 📚 Table of Contents

1. [Overview](#overview)
2. [Fundamental Concepts](#fundamental-concepts)
3. [Arrays](#arrays)
4. [Data Types](#data-types)
5. [Object-Oriented Programming](#object-oriented-programming)
6. [Constraints](#constraints)
7. [Randomization](#randomization)
8. [Assertions](#assertions)
9. [Coverage](#coverage)
10. [Concurrency & Threading](#concurrency--threading)
11. [Synchronization Primitives](#synchronization-primitives)
12. [Advanced Topics](#advanced-topics)
13. [Interview Questions](#interview-questions)
14. [Repository Structure](#repository-structure)
15. [Getting Started](#getting-started)

---

## Overview

This repository contains well-documented SystemVerilog code examples demonstrating various concepts used in verification and design. Each file includes detailed inline comments explaining every line of code, making it an excellent learning resource for both beginners and experienced engineers.

### Key Features

- ✅ **Detailed Comments**: Every line of code is explained with clear comments
- ✅ **Comprehensive Coverage**: All major SystemVerilog concepts included
- ✅ **Practical Examples**: Real-world examples and interview questions
- ✅ **Professional Structure**: Well-organized directory structure
- ✅ **Easy to Understand**: Beginner-friendly explanations

---

## Fundamental Concepts

### Program Blocks
**Location**: `program_block.sv`

Program blocks provide a clear separation between testbench code and design code. They ensure proper simulation semantics and help avoid race conditions.

**Key Concepts**:
- Program blocks execute in a reactive region
- Clear separation of testbench from design
- Better simulation control

### Packages
**Location**: `packages.sv`

Packages group related declarations together, providing a namespace mechanism. They can be imported into modules, classes, or other packages.

**Key Concepts**:
- Namespace management
- Code reusability
- Import mechanism (`import pkg::*`)
- Shared declarations across modules

### Scope Resolution Operator
**Location**: `scope_resolution_operator.sv`

The `::` operator accesses static members and methods of a class without requiring an object instance.

**Key Concepts**:
- Static members belong to the class, not instances
- Access using `class_name::member`
- No object instantiation needed

### Extern Keyword
**Location**: `extern_keyword.sv`

The `extern` keyword allows function/task definitions outside the class body, keeping class declarations clean.

**Key Concepts**:
- Separation of declaration and definition
- Cleaner class interfaces
- Implementation outside class body

### For Loops
**Location**: `for_loop.sv`

SystemVerilog supports enhanced for loops with multiple initialization and increment statements.

**Key Concepts**:
- Multiple loop variables
- Enhanced control flow
- Initialization, condition, and increment

### Data Type Conversions
**Location**: `data_type_conversions.sv`

Type casting converts values from one data type to another using the syntax `type'(expression)`.

**Key Concepts**:
- Type casting: `int'(real_value)`, `bit'(value)`, `byte'(value)`
- Explicit conversions
- Type safety

### Deep Copy vs Shallow Copy
**Locations**: `deep_copy.sv`, `shallow_copy.sv`

- **Deep Copy**: Creates independent copies; changes to copy don't affect original
- **Shallow Copy**: Copies handle reference; both point to same object

**Use Cases**:
- Deep copy: Independent object manipulation
- Shallow copy: Shared object references

---

## Arrays

SystemVerilog provides several array types, each suited for different use cases.

### Fixed-Size Arrays
**Locations**: 
- `arrays/one_dimentional_array.sv`
- `arrays/two_dimentional_array.sv`
- `arrays/three_dimentional_array.sv`
- `arrays/unpacked_array.sv`

**Key Concepts**:
- Pre-defined size
- Memory allocated at compile time
- Direct indexing
- Multi-dimensional support

### Dynamic Arrays
**Location**: `arrays/dynamic_array.sv`

Arrays with size that can be changed during simulation.

**Key Concepts**:
- Size allocated at runtime: `new[size]`
- Can be resized: `new[new_size]`
- Memory efficient for variable-sized data
- Methods: `size()`, `delete()`

### Associative Arrays
**Locations**: 
- `arrays/associative_array/integer_index.sv`
- `arrays/associative_array/string_index.sv`

Sparse arrays using integer or string keys, similar to hash tables.

**Key Concepts**:
- Only occupied indices consume memory
- Integer keys: `int array[*]`
- String keys: `int array[string]`
- Methods: `num()`, `first()`, `last()`, `next()`, `prev()`, `delete()`

### Array Methods

#### Reduction Methods
**Location**: `arrays/array_reduction_methods.sv`

Perform operations on all array elements, returning a single value.

**Methods**:
- `sum()`: Sum of all elements
- `product()`: Product of all elements
- `or()`, `and()`, `xor()`: Bitwise operations
- `sum() with (item*2)`: Transform before summing

#### Ordering Methods
**Location**: `arrays/array_ordering_methods.sv`

Rearrange array elements in place.

**Methods**:
- `sort()`: Ascending order
- `rsort()`: Descending order
- `shuffle()`: Random order
- `reverse()`: Reverse order

#### Locator Methods
**Location**: `arrays/array_locator_or_finding_methods.sv`

Find elements matching criteria, returning a queue.

**Methods**:
- `min()`: Minimum value(s)
- `max()`: Maximum value(s)
- `find with (condition)`: All matching elements
- `find_first with (condition)`: First match
- `find_last with (condition)`: Last match
- `unique()`: Unique values

---

## Data Types

### Enumerated Types
**Location**: `datatypes/enum_datatype.sv`

Named constants with automatic integer assignments (starting at 0).

**Key Concepts**:
- Readable code: `enum {red, blue, green} color`
- Methods: `first()`, `last()`, `next()`, `prev()`
- Type safety

### Structures
**Location**: `datatypes/struct_datatype.sv`

Groups related variables together.

**Key Concepts**:
- Member access: `struct_name.member`
- Literal assignment: `'{value1, value2, ...}`
- Packed and unpacked structures

### Typedef
**Location**: `datatypes/typedef_datatype.sv`

Creates type aliases for reusable type definitions.

**Key Concepts**:
- User-defined types
- Code readability
- Type reuse: `typedef enum {...} color_type`

### Strings
**Location**: `string/string.sv`

Dynamic character arrays with built-in manipulation methods.

**Key Methods**:
- `len()`: String length
- `toupper()`, `tolower()`: Case conversion
- `putc(index, char)`: Replace character
- `getc(index)`: Get character

---

## Object-Oriented Programming

### Classes and Objects
**Location**: `oops_concepts/oops_concept.sv`

SystemVerilog supports object-oriented programming with classes.

**Key Concepts**:
- Class definition: `class class_name`
- Object creation: `new()`
- Member access: `object.member`
- Encapsulation

### Inheritance
**Location**: `oops_concepts/inheritance.sv`

Child classes inherit members from parent classes.

**Key Concepts**:
- Syntax: `class child extends parent`
- Access to parent members
- Code reuse
- Hierarchical relationships

### Polymorphism
**Location**: `oops_concepts/polymorphism.sv`

Runtime method resolution based on object type.

**Key Concepts**:
- `virtual` keyword enables polymorphism
- Parent handle pointing to child object
- Runtime binding
- Method overriding

### $cast
**Location**: `oops_concepts/$cast.sv`

Safe type conversion between related types (parent to child).

**Key Concepts**:
- Returns 1 on success, 0 on failure
- Safe downcasting
- Type checking

### Super Keyword
**Location**: `oops_concepts/super_keyword.sv`

Access parent class members from child class.

**Key Concepts**:
- `super.method()`: Call parent method
- `super.variable`: Access parent variable
- Explicit parent access

### This Keyword
**Location**: `oops_concepts/this_keyword.sv`

Refers to current object instance.

**Key Concepts**:
- Resolve name conflicts
- `this.member`: Access member variable
- Self-reference

### Virtual Classes (Abstract Classes)
**Location**: `oops_concepts/abstraction_or_virtual_class.sv`

Cannot be instantiated directly; must be extended.

**Key Concepts**:
- `virtual class` declaration
- Base class design
- Forced inheritance
- Template for derived classes

---

## Constraints

Constraints control randomization behavior, ensuring generated values meet specific requirements.

### Basic Constraints
**Location**: `constraints/if_else_constraint.sv`

Conditional constraints using if-else statements.

**Key Concepts**:
- `if (condition) constraint1 else constraint2`
- Conditional value assignment
- Dynamic constraint application

### Inside Constraint
**Location**: `constraints/inside_constraint.sv`

Restricts values to specified ranges or sets.

**Key Concepts**:
- Syntax: `variable inside {range1, range2, ...}`
- Multiple valid ranges
- Set-based constraints

### Distribution Constraint
**Location**: `constraints/distribution_constraint.sv`

Assigns probability weights to value ranges.

**Key Concepts**:
- `dist` keyword
- Weight assignment: `:=` (equal weight), `:/` (distributed weight)
- Probability control

### Unique Constraint
**Location**: `constraints/unique_constraint.sv`

Ensures all values in a set are different.

**Key Concepts**:
- `unique {variable1, variable2, ...}`
- No duplicate values
- Array element uniqueness

### Soft Constraint
**Location**: `constraints/soft_constraint.sv`

Constraints that can be violated if hard constraints conflict.

**Key Concepts**:
- `soft` keyword
- Hard constraints take precedence
- Flexible constraint resolution

### Inline Constraint
**Location**: `constraints/inline_constraint.sv`

Constraints specified directly in `randomize()` call.

**Key Concepts**:
- Temporary constraint application
- Override class constraints
- Dynamic constraint modification

### Additional Constraint Examples
- `constraint_out_of_the_class.sv`: Constraints defined outside class
- `inheritance_in_constraint.sv`: Constraints in inherited classes
- `solve_a_before_b_constraint.sv`: Constraint ordering
- `no_is_divided_by_4.sv`: Mathematical constraints
- `fibonacci_series_by_using_constraint.sv`: Complex pattern constraints

---

## Randomization

Randomization generates random values for verification scenarios.

### Rand vs Randc
**Locations**: `randomization/repeat.sv`, `randomization/without_repeat.sv`

- **rand**: Generates new random value each time (may repeat)
- **randc**: Cyclic randomization (all values before repeating)

**Key Concepts**:
- `rand`: Standard randomization
- `randc`: Cyclic randomization
- Coverage enhancement

### Randomization Methods
**Locations**: 
- `randomization/by_using_range_method.sv`
- `randomization/different_modes.sv`
- `randomization/without_using_rand.sv`

**Key Concepts**:
- `randomize()`: Standard randomization
- `randomize() with {...}`: Inline constraints
- Range methods: `$urandom_range()`

---

## Assertions

Assertions verify design behavior and properties.

### Immediate Assertions
**Location**: `assertions/immidiate_assertion.sv`

Execute immediately when encountered (not clocked).

**Key Concepts**:
- `assert (condition)`
- Pass/fail blocks
- Event control: `@(posedge clk)`
- Immediate evaluation

### Sequence Assertions
**Location**: `assertions/sequence_assertion.sv`

Check temporal properties over multiple clock cycles.

**Key Concepts**:
- `sequence`: Temporal patterns
- `property`: Property definitions
- `assert property`: Concurrent assertions
- Clock-based evaluation

---

## Coverage

Coverage tracks simulation coverage of design features.

### Basic Coverage
**Location**: `coverages/coverage.sv`

Coverage groups with various bin types.

**Key Concepts**:
- `covergroup`: Coverage group definition
- `coverpoint`: Variable being covered
- `bins`: Coverage bins
- `sample()`: Sample coverage data

**Bin Types**:
- Fixed bins: `bins name = {value}`
- Array bins: `bins name[] = {value1, value2, ...}`
- Range bins: `bins name[] = {[min:max]}`
- Wildcard bins: `wildcard bins name = {pattern}`
- Transition bins: `bins name[] = (value1 => value2)`
- Default bins: `bins name[] = default`
- Ignore bins: `ignore_bins name = {values}`
- Illegal bins: `illegal_bins name = {values}`

### Cross Coverage
**Location**: `coverages/cross_coverage.sv`

Coverage between multiple variables.

**Key Concepts**:
- `cross`: Cross coverage between coverpoints
- Combination coverage
- Multi-dimensional coverage

### Coverage with Clause
**Location**: `coverages/with_clause.sv`

Conditional coverage bins.

**Key Concepts**:
- `with (condition)`: Filter coverage
- Conditional binning
- Selective coverage

---

## Concurrency & Threading

SystemVerilog supports concurrent execution through fork-join blocks.

### Fork-Join
**Location**: `fork_joins_or_threads/join_or_join_all.sv`

All threads execute concurrently; parent waits for all to complete.

**Key Concepts**:
- `fork ... join`: Wait for all threads
- Concurrent execution
- Synchronization point

### Fork-Join Any
**Location**: `fork_joins_or_threads/join_any.sv`

Parent continues after first thread completes.

**Key Concepts**:
- `fork ... join_any`: Wait for any thread
- Early continuation
- Background execution

### Fork-Join None
**Location**: `fork_joins_or_threads/join_none.sv`

Parent continues immediately; threads run in background.

**Key Concepts**:
- `fork ... join_none`: No waiting
- Fire-and-forget threads
- Background processing

### Wait Fork
**Location**: `fork_joins_or_threads/wait_fork.sv`

Waits for all child threads to complete.

**Key Concepts**:
- `wait fork`: System task
- Thread synchronization
- Complete all spawned threads

### Disable Fork
**Location**: `fork_joins_or_threads/disable_fork.sv`

Terminates all child threads spawned by fork-join.

**Key Concepts**:
- `disable fork`: System task
- Thread termination
- Cleanup mechanism

---

## Synchronization Primitives

### Mailboxes
**Locations**: `mailbox/bounded.sv`, `mailbox/un_bounded.sv`

Thread-safe communication channels between processes.

**Key Concepts**:
- **Bounded**: Fixed capacity; `put()` blocks when full
- **Unbounded**: Unlimited capacity
- `put()`: Send message (blocking)
- `get()`: Receive message (blocking)
- `try_put()`, `try_get()`: Non-blocking versions

### Semaphores
**Locations**: `semaphore/sema.sv`, `semaphore/sema_by_using_fork_join.sv`

Resource counting and mutual exclusion.

**Key Concepts**:
- `new(count)`: Create with initial keys
- `put(count)`: Return keys (non-blocking)
- `get(count)`: Acquire keys (blocking)
- Resource access control
- Thread synchronization

### Queues
**Locations**: `queue/bounded_queue.sv`, `queue/unbounded_queue.sv`

Dynamic data structures with FIFO/LIFO access.

**Key Concepts**:
- **Bounded**: Maximum size limit `[$:max_size]`
- **Unbounded**: No size limit `[$]`
- Methods: `push_front()`, `push_back()`, `pop_front()`, `pop_back()`
- `insert(index, value)`: Insert at position
- `delete()`: Remove all elements
- `size()`: Get current size

---

## Advanced Topics

### Conditional Statements

#### Priority If
**Location**: `if_conditions/priority_if.sv`

Ensures at least one branch executes; error if all conditions false.

**Key Concepts**:
- `priority if`: Enforced execution
- Simulation error on all false
- Guaranteed branch execution

#### Unique If
**Location**: `if_conditions/unique_if.sv`

Ensures exactly one branch executes; error if multiple conditions true.

**Key Concepts**:
- `unique if`: Mutually exclusive branches
- Simulation error on multiple true
- Exclusive execution guarantee

---

## Interview Questions

The repository includes practical interview questions covering various SystemVerilog concepts.

### Pattern Generation
**Location**: `interview_questions/pattern_generation/`

Examples demonstrating pattern generation techniques.

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

## Repository Structure

```
System Verilog/
├── arrays/                          # Array types and methods
│   ├── associative_array/          # Associative arrays
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

## Getting Started

### Prerequisites

- SystemVerilog simulator (ModelSim, QuestaSim, VCS, Xcelium, etc.)
- Basic understanding of Verilog/SystemVerilog syntax

### Running Examples

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/systemverilog.git
   cd systemverilog
   ```

2. **Compile and run**:
   ```bash
   # Example: Compile and run a specific file
   vlog program_block.sv
   vsim -c program_block -do "run -all; quit"
   ```

3. **View waveforms**:
   ```bash
   # Files with $dumpfile will generate VCD files
   vsim program_block
   # Add signals to waveform viewer
   ```

### Study Path

1. **Beginner**: Start with fundamental concepts
   - Program blocks
   - Packages
   - Basic data types
   - Arrays (one-dimensional)

2. **Intermediate**: Move to advanced topics
   - OOP concepts
   - Constraints
   - Randomization
   - Assertions

3. **Advanced**: Explore complex topics
   - Coverage
   - Concurrency
   - Synchronization primitives
   - Interview questions

---

## Key SystemVerilog Features Demonstrated

- ✅ **Object-Oriented Programming**: Classes, inheritance, polymorphism
- ✅ **Constrained Randomization**: Random value generation with constraints
- ✅ **Coverage**: Functional coverage tracking
- ✅ **Assertions**: Design verification
- ✅ **Concurrency**: Fork-join, threads, synchronization
- ✅ **Advanced Arrays**: Dynamic, associative, queues
- ✅ **System Tasks**: $display, $time, $finish, etc.
- ✅ **Data Structures**: Structures, unions, enums

---

## Best Practices Demonstrated

1. **Code Organization**: Logical directory structure
2. **Documentation**: Comprehensive inline comments
3. **Naming Conventions**: Clear, descriptive names
4. **Modularity**: Reusable components
5. **Error Handling**: Proper constraint checking
6. **Code Reusability**: Packages and classes

---

## Contributing

Contributions are welcome! Please ensure:
- All code includes detailed comments
- Examples are clear and well-documented
- Code follows SystemVerilog best practices
- Files are properly organized

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

## Additional Resources

- [IEEE SystemVerilog Standard](https://standards.ieee.org/)
- [SystemVerilog LRM](https://standards.ieee.org/ieee/1800/6827/)
- [Verification Academy](https://verificationacademy.com/)

---

**Happy Learning! 🚀**

For questions or suggestions, please open an issue or contribute to the repository.

