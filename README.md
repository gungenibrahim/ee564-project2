# EE564 Project-2

## Motor Winding Design & Analysis

## Deadline 23/04 23:59

## Grading and Procedure

See the [Evaluation](./evaluation.md) sheet for details.

### Lamination Selection

In the project folder you'll find the several induction motor laminations from [Kienle Spiess](http://www.kienle-spiess.de/induction-machines.html). Please select a lamination. Although, students are allowed to work on same laminations, I don't want close friends to work on the same lamination. I expect you to work independently, and there is no difference of difficulty between laminations. 

You can find the definitions of the parameters in the legend file. You can also get registered in [Kienle Spiess](http://www.kienle-spiess.de/induction-machines.html) to get extra information. Throughout the assignment, please ignore small features of the drawings (i.e. drill holes, shaft opening, tolerances, fillet radius etc).

You can select any lamination material, but please refer to the data-sheet of the material and thickness you choose.


## Q1) Winding Design

For the lamination you had chosen, depending on the number of stator slots and rotor slots, design a winding diagram including but not limited to:

- Number of poles
- Type of winding (integral, fractional, single layer, double layer etc.)
- Winding diagram
- Winding factors (including first few harmonics)
- Number of turns, and wire size
- Fill factor
- Winding connection (delta-wye)
- Aimed voltage and current ratings

For the winding you selected please plot the MMF waveform for two different instants for a balanced three-phase current (i.e. Ia=1 A, Ib=-0.5 A, Ic=-0.5A) ignoring rotor slots for this stage.

## Q2) Motor Parameter Estimation

Choose an axial length for the lamination. Also choose an airgap clearance value (reduce the rotor diameter appropriately).  There is not a definite answer, but please try to choose reasonable numbers. Then determine the following:

- Choose (calculate) the specific magnetic loading and also the flux densities in stator teeth, stator back core.
- Determine (calculate) the specific electric loading (in the last step you will be required to verify these)
- Calculate the approximate torque and speed of your design based on your assumptions
- Calculate the equivalent circuit parameters for your design (i.e. phase resistance, phase inductance, leakage inductance etc.)
- Calculate the approximate core and copper losses at the rated operating conditions.

You can find useful examples in your handouts and also [in this link](http://www.ssmengg.edu.in/weos/weos/upload/EStudyMaterial/electrical/6thsem/Machine%20design(ELE-603)/Electrical%20Machine%20Design%20Unit6VH.pdf).


## Q3) Detailed Analysis & Verification

Using a computer tool (some suggestions are given below), verify the analytical designs. Try to obtain the following and any other relevant data you may suggest:

- Torque-Speed Characteristics
- Flux density distribution at different conditions
- Current waveforms at rated conditions
- Efficiency curves 
- Equivalent circuit parameters
- Effect of skewing etc.

## Useful Software

Apart from the analytical calculations you are required to use software tools to verify your calculations.

- [ANSYS Maxwell](https://www.ansys.com/products/electronics/ansys-maxwell): Especially the RmXprt toolbox of Maxwell will the most useful option. You can also use Maxwell 2D simulations for flux density calculations.
- [MotorAnalysis](http://motoranalysis.com/): A free MATLAB GUI for induction motor design. Although it may be slow for some cases, it is easy to use and simple tool.
- [Dolomites](https://sourceforge.net/projects/dolomites/): It has a few useful design snippets that you can refer.

There are also other software you can use in the course web page.
