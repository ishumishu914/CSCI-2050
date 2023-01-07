# Base x64 Linux Assembly

A starter project for building and running x64 architecture assembly language projects on Linux.

## Software Installation

This starter project uses the `yasm` assembler, and the `make` build tool.  These tools can be installed with the following command:

`sudo apt install yasm make`

Even though it is not required to use this project, it is also recommended that you install `gdb`, which is a text-based debugger.  To install `gdb`, use the following command:

`sudo apt install gdb`

## Building the Program

The following command runs the assembler and links the resulting object code:

`make`

## Running the Program

The following command runs the assembler and links the resulting object code:

`./main.out`

## Cleaning Up

The following command deletes the binary files generated during the build process:

`make clean`