# MorganPHD_LLFSM_Evaluation

This repository contains the code and raw machine files for evaluating the VHDL LLFSM template.
The evaluation here is not exhaustive of all LLFSM semantics but does contain test benches for possible branches through a single ringlet.
This repository is a small part of many other repositories referenced in my PhD.

The directory structure is as follows:

- All folders ending in `.machine` represent LLFSM definitions without the generated VHDL source files. The source
files are provided separately within the other folders of this repository but if you would like to
generate the source files yourself, then you can use the [llfsm-generate](https://github.com/CPSLabGU/LLFSMGenerate) tool.
- The `accepting_waiting` folder contains examples where LLFSMs execute their *Internal* action.
- The `looping_triggering` folder contains examples where LLFSMs execute their *OnExit* action.

You may import the example VHDL code into a simulation environment to view the waveforms of the executing LLFSMs.
Alternatively, the LLFSM generated code is ready for synthesis so you may use the LLFSM VHDL files in hardware for further
experimentation.
