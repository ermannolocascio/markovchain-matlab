# Markov Chain MATLAB

**Matlab Example of Markov Chain with N Agents**

In this simple example, a Markov Chain is implemented considering N agents. The length of the simulation is set along with the number of agents that come into play. The term "agent" in this example refers to the number of people in the zone.

This code enables the stochastic simulation of occupancy in a specific zone based on the probabilities set in the transition matrix. The transition matrix can be further extended to embed the real transition probabilities at each step (currently using proxy values).

The core of the code is the 'randsample()' which is used to generate the pseudo-random number (conditioned probabily) that describes the nextState. 

<img src="assets/Markov_N-agents.jpg" width="628"/>
