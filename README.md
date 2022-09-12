#Build and debug STM32 devices using VsCode and CMake


The board directory contains the files and cubemx project files specific to a particular board

each subdirectory within the board corresponds to one specific board
the name of the board dicectory should corespond to the "board" field in the cubemx (.ioc).ioc file, but in all lower case

The board dir contains the cubemx.ioc project file. This should always be name cubemx.ioc

the board dir also contains the cubemx_output directory, which holds the raw output from the cubemx project.

To generate a new set of source code using cubemx

 1. Configure the board/pins and peripherals
 2. Under Project Manager(tab) 
    1. Under Project (left pane) 
       1. set the Project Location to the cubemx_output dir
       2. set *Toolchiain /IDE* to *Makefile*
    2. Under Code Generator (left pane)
       1. Select "Add necessary library files as reference..."
 3. Other values should be good as default
 4. Click GENERATE
