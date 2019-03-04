# FPGA
Introductory text.

## Initialization
Text.

## Temporary Conventions
- target language: VHDL
- always copy files (sources, contraints etc.) into project
- all type definitions & constants (including states) in capital
- all signals must be initialized
- must be prefixed (except in main)(i_ = input, o_ = output, s_ = signal, r_ = register)
- use tabs of size 4 (tools -> settings -> text editor)
- the top module is per default the module name (e.g. some_module.vhd) where subcomponents are further specified (e.g. some_module_part.vhd)
- architecure naming:
	- main:	structure
	- entity: behaviour
