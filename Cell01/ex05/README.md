# README

This project contains a number of examples and explanations on the use of functions in R. The main contents of the `FUNCTIONS.R` file are described below.

## Contents

### 1. Function Definitions
- **myFun**: A simple function that adds two numbers.
- **power**: A function that raises a number to a specified power.

### 2. Function Arguments
- **Arguments by name and order**: Examples of how to pass arguments by name and in order.
- **Default Values**: How to assign default values ​​to the arguments of a function.

### 3. Functions without Arguments
- **hello**: A function that prints "Hello world!".

### 4. Unnamed Arguments
- **pwrSum**: A function that sums the elements raised to a power, with additional arguments.

### 5. Error Control
- **stopifnot**: Checking conditions.
- **stop**: Emission of error messages.
- **warning**: Emission of warnings.
- **message**: Emission of informational messages.

### 6. Variable Classes
- **Formal, local and free variables**: Examples of how different types of variables are used within a function.

### 7. Lexical Scope
- **Environments and nested functions**: Examples of how free variables should be available in the environment where the function was created.

### 8. Functions that Return Functions
- **constructor**: A function that returns another function.

### 9. Higher Order Functions
- **lapply**: Application of a function to each element of a list.
- **do.call**: Use of elements of a list as arguments of a function.
- **Reduce**: Successive combination of elements of an object by applying a binary function.

### 10. Recursive Functions
- **fib**: Example of a recursive function to calculate the Fibonacci series.

### 11. Debugging and Performance Analysis
- **traceback**: Post-mortem analysis.
- **debug**: Step-by-step execution of a function.
- **trace**: Greater control in debugging.
- **system.time**: Measurement of CPU time.
- **Rprof**: Detailed performance analysis.