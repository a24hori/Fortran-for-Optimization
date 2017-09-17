# Fortran_for_Optimization
For self-study and motivate myself to keep studying. This repository will provide optimization techniques with Fortran90. <br>

### Why are you learning Fortran?
- Because I am a twister, just like those people who love old-fashioned thoughts. Nowadays, in compiler languages, many Fortran programs have been replaced by C/C++. However, in academic fields or basic numerical analyzing software, Fortran is still in use because of over years of reliability and fast execution, for example, Fortran was used for controlling satellite by NASA. Also in the field of mathematical optimization, the basic computation is written in Fortran.<br>
 *Note*: Since I am not a specialist in software development, the programs uploaded on this repository looks very ugly.

### GOAL
- My goal of this project is to implement an algorithm for solving a variational inequality:<br>
Find x\in X such that F(x)^T (y-x)\geq 0, \forall y\in X,<br>
where X is a nonempty closed convex set on R^n, and F:R^n -> R^n is a vector-valued function. The model can be seen many problems, for example, in game theory, the Nash equilibrium problem may be reformulated as the variational inequality problem.