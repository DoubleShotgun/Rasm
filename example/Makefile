.SILENT: all

all: 
	mkdir -p build
	$(MAKE) -s Hello 
	$(MAKE) -s Kitty

Hello:
	rasm o build/Hello Hello.asm
	echo "Compiled 'Hello.asm'"
Kitty:
	rasm o build/Kitty Kitty.asm
	echo "Compiled 'Kitty.asm'"
