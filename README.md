# String Calculator TDD Kata

[![CI](https://github.com/mehul-jain1/string_calculator_tdd/actions/workflows/test.yml/badge.svg)](https://github.com/mehul-jain1/string_calculator_tdd/actions/workflows/test.yml)

This repository contains a solution to the String Calculator TDD Kata, implemented in Ruby using Minitest. The development process strictly followed Test-Driven Development (TDD) principles, with frequent commits tracking the evolution of the code after each passed test and refactoring cycle.

## Implemented Requirements

The calculator supports the following features:

1.  **Basic Numbers**: Handles an empty string, a single number, and two comma-separated numbers.
2.  **Arbitrary Numbers**: Handles any amount of comma-separated numbers.
3.  **Newline Delimiters**: Allows `\n` as a valid delimiter between numbers (e.g., `"1\n2,3"`).
4.  **Custom Delimiters**: Supports custom delimiters of any length, specified at the beginning of the string.
    -   Single character: `//;\n1;2`
    -   Any length: `//[***]\n1***2***3`
5.  **Multiple Custom Delimiters**: Supports multiple custom delimiters, each of any length.
    -   `//[*][%]\n1*2%3`
    -   `//[**][%%]\n1**2%%3`
6.  **Negative Numbers**: Throws an `ArgumentError` if negative numbers are provided. The exception message includes all the negative numbers found.
7.  **Ignore Large Numbers**: Numbers greater than 1000 are ignored in the calculation.

## Project Structure

```
.
├── Gemfile
├── lib
│   ├── input_parser.rb
│   └── string_calculator.rb
├── README.md
├── Rakefile
└── test
    └── test_string_calculator.rb
```

## Setup and Usage

### Prerequisites

-   Ruby
-   Bundler

### Installation

1.  Clone the repository:
    ```sh
    git clone <repository-url>
    cd string_calculator_tdd
    ```

2.  Install the required gems:
    ```sh
    bundle install
    ```

### Running Tests

To run the full test suite, use Rake:

```sh
bundle exec rake
```

This will execute all the tests defined in the `test/` directory.

### Test Output

A successful test run will produce the following output:

```
Run options: --seed 4938

# Running:

...........

Finished in 0.000446s, 24663.6760 runs/s, 29147.9808 assertions/s.

11 runs, 13 assertions, 0 failures, 0 errors, 0 skips
```