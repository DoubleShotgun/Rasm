# Rasm

Rasm is a simple but powerful [RISC-V](https://riscv.org/about/) (RV64I) assembler that aims to make the syntax to be more like [C](https://en.wikipedia.org/wiki/C_(programming_language)), and it's written in [Nelua](https://nelua.io).
<br>

## Syntax

Rasm's syntax is just like the RV64I standard, except for these changes: 

- The load and store instructions no longer have the special syntax. <br>
`ld rd,imm(r1) -> ld rd,r1,imm` <br>
See [Todo](https://github.com/DoubleShotgun/Rasm#Todo) for more.
- Load a string globally. <br>
`String = "Hello!"` <br>
`String` is now a label!
- Prefixing a label with '%' while refering, gets the length of the label.
`li a0,%String`

## Usage
```
Usage: rasm [d][s][o a.out] filein.asm
'-' are optional.
```
* Options
	- d: dump compiled raw binary to 'dump.bin'
	- s: add section name (Advance)
	- o a.out: outfile for compiled code

## Instruction Set

- [x] RV64I Base <br>
- [x] Pseudoinstruction <br>
- [x] Integer Multiplication and Division Extension <br>
- [ ] Single-Precision Floating-Point Extension <br>
- [ ] Double-Precision Floating-Point <br>
- [ ] Compressed Instructions
## Setup & Install

### Install Qemu User Static

You will need Qemu User Static run to the executable.

Debian/Ubuntu (apt)
```
apt update
apt install qemu-user-static
```
Void Linux (xbps)
```
xbps-install -Su qemu-user-static
```

### Building with Nelua:
1. [Install Nelua](https://nelua.io/installing/)
2. Clone Rasm `git clone https://github.com/Doubleshotgun/Rasm`
3. Compile 
```
cd Rasm
make
```


### Building with GCC/Clang:
1. Clone Rasm `git clone https://github.com/Doubleshotgun/Rasm`
2. Compile 
```
cd Rasm
make CC
```

### Installing
The executable is automatically install at `/usr/local/bin/`
## Example

- example.asm

```
exit = 93

_start:
	li a7,exit
  li a0,69
  ecall
```
- bash

```
rasm example.asm
qemu-riscv64-static a.out
echo $?
```

This program returns exit code of 69, `echo $?` prints the exit code of the last program

See the [example](https://github.com/DoubleShotgun/Rasm/blob/main/example) folder for more.

## Todo
- [ ] Rework the "Syntax system".
- [ ] Rework the syntax of "call" and "ecall".
```
label(a0,a1,...)
```
Will be equivalent to:

```
li a0,1
la a1,String
call label
```

- [ ] Link to C libraries.
- [ ] Better error message.
- [ ] Add array, struct and vectors.
*   Make standard library.
	- [ ] io
	- [ ] string
	- [ ] time
	- [ ] math
	- [ ] fb (frame buffer device)
	- [ ] [Rives](https://rives.io/)

- [ ] Tested on Window.
