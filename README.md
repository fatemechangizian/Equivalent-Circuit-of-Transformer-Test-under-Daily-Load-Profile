# Equivalent-Circuit-of-Transformer-Test-under-Daily-Load-Profile
This is the class project designed for the "Electrical Machinery II" course in Spring 2017 (2nd semester/Academic year: 2016-2017)

Step 1: Creating MATLAB file that get the nominal specifications of a single-phase transformer as an input, including the apparent power, high voltage side voltage, low voltage side voltage.
Then take the open circuit test information and short circuit as well. 
This program must calculate all the parameters of the transformer separately and provide them to the user in the output.

Note 1: Note that open circuit testing is performed on the low pressure side and short circuit testing is performed on the high pressure side.
Note 2: The values provided for the test may not be exactly the same as the nominal values of the transformer and may eventually change within the nominal values.

Step 2: In the Simulink environment, with the help of circuit elements (resistance and inductor) and the model of an ideal transformer, create real model of a single-phase transformer.
Then link the parameters obtained in the first step one by one to the elements in the Simulink file so that the information is automatically transferred to the Simulink file.
Now assume that you connect the following load with the following 24-hour profile to the low transformer pressure and connect the high pressure side to the rated voltage for 24 seconds.
Display the shape of the input load current profile, the output load current, and the voltage across the load in the Simulink environment.

Step 3: Using the load profile given in the second step, show the input power, output power, transformer losses, transformer efficiency and voltage regulation in different load ranges for the desired time period.

