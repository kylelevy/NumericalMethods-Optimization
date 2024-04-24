# Basic SPICE Simulator

Simple electric circuits can be modelled as a system of linear equations. The basic SPICE simulator is an algorithm which solves these systems of equations using different numerical methods. In this case, we will be solving various circuits using components such as voltage sources, current sources, resistors, capacitors, and inductors. Circuits will be fed into the program as their [Netlist description](https://en.wikipedia.org/wiki/Netlist).

To create the system of equations, we can model the circuit as:

$$A x = b$$

Since the goal is to solve for the voltages for this demonstration, $x$ is a vector of the voltages at each node. Using Ohm's Law:

$$
V=IR \implies \frac{1}{R} V = I
$$

Thus the $A$ matrix is the admitance of each element, and the $b$ vector is the current through each resistive element. *Note: R is the impedance of the element.*

Using this convention, we can create "stamps" for each element that can be superimposed to create the A matrix. Now that we have setup the matrix representation of the system, we can begin solving using elimination.

## Gaussian Elimination with Partial Pivoting

Gaussian Elimination is the method of performing row operations to elimenate  non-zero entries below the main diagonal and then solving for the unknowns from bottom to top. The process of elimenating the values below the diagonal is called Forward Elimination. The process of solving for the unknowns using the resulting matrix is called Back Substitution. More details can be found [here](https://en.wikipedia.org/wiki/Gaussian_elimination#Example_of_the_algorithm).


Partial Pivoting is the process of switching the rows during the Forward Elimination to have the pivot element have the highest magnitude in its column. The advantage of partial pivoting is that it preserves accuracy when dealing with truncation error and can simplify computations by avoiding floating point numbers when integers may suffice.

## PLU Decomposition

PLU Decomposition is a modification of Gaussian Elimination which allows us to quickly solve a system with a variety of inputs. It involves decomposing the original A matrix into an upper triangular and lower triangular matrix. This is done by performing Forward Elimination where the scaling between each row is noted as an element of the lower matrix and the resulting matrix is called the upper matrix. We denote the lower matrix as L and the upper matrix as U. If any pivoting occurs, it is stored in the matrix P as a adjacency matrix. More details can be found [here](https://en.wikipedia.org/wiki/LU_decomposition#Example).

The advantage to this decomposition is that if the A matrix remains the same, but the b vector is changed, we do not need to recompute the Gaussian Elimination. Instead we can take advantage of the properties of the $L$ and $U$ matricies to quickly find the solution of the new system.

$$PA=LU$$

$$Ax=LUx=b$$

$$L(Ux) = b$$

$$Lb' = b$$

$$Ux = b'$$

Instead of having to recompute $U$, we can instead apply the transformation used to obtain $U$, stored in $L$, to the new $b$ vector and denote it as $b'$. Now that we have $b'$, we can apply back substitution and solve right away.

This method saves a lot of time when testing a system over a variety of b vectors, as demonstrated in the sweep portion of the simulation.
