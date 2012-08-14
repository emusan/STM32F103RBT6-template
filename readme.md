# Small template project for the STM32F103RBT6 ARM microcontroller

This is just a little template/starting project for this controller.

When compiled and sent to the device it will flash an LED on pin C12.
(This pin is connected to an LED already on the [Olimex dev board](https://www.olimex.com/dev/stm32-h103.html))

This project is starting off as essentially a copy of the project laid out in [this guide](http://www.seng.de/downloads/HowTo_ToolChain_STM32_Ubuntu.pdf) with a few addittions/changes here and there, it will also be adapted in the future to better fit with my projects.

I have also included a flash.cfg file which will can be used to flash the output onto the microcontroller, it is currently designed for use with a Bus Blaster JTAG interface, though another can be used through changing a line.

To use it, you will need openocd:

	sudo openocd -f flash.cfg

Please feel free to do with this stuff what you like, if it helps you at all please let me know :).
