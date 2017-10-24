# Fortran_for_Optimization
For self-study and motivate myself to keep studying. This repository will provide optimization techniques with Fortran90. <br>

## Why are you learning Fortran?
<p>Because I am a twister, just like those people who love old-fashioned thoughts. Nowadays, in compiler languages, many Fortran programs have been replaced by C/C++. However, in academic fields or basic numerical analyzing software, Fortran is still in use because of over years of reliability and fast execution, for example, Fortran was used for controlling satellite by NASA. Also in the field of mathematical optimization, the basic computation is written in Fortran.</p>
*Note*: Since I am not a specialist in software development, the programs uploaded on this repository looks very ugly.<br>

## GOAL
<p>My goal of this project is to implement an algorithm for solving a variational inequality:<br>
<img src="http://www.sciweavers.org/tex2img.php?eq=%5Cmbox%7BFind%3A%7D%5C%20x%5E%2A%5Cin%20X%5C%20%5Cmbox%7Bsuch%20that%7D%5C%20F%28x%5E%2A%29%5ET%20%28x-x%5E%2A%29%5Cgeq%200%2C%5C%20%5Cforall%20x%5Cin%20X&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0" align="center" border="0" alt="\mbox{Find:}\ x^*\in X\ \mbox{such that}\ F(x^*)^T (x-x^*)\geq 0,\ \forall x\in X" width="381" height="21" /><br>
where X is a nonempty closed convex set on R^n, and F:R^n -> R^n is a vector-valued function. The model can be seen many problems, for example, in game theory, the Nash equilibrium problem may be reformulated as the variational inequality problem.</p>

## Examples
#### steepest_descent.f90
- The steepest descent method is a numerical algorithm for solving an unconstrained optimization problem:<br>
	Minimize: f(x),
where f:R^n -> R is continuously differentiable. For the details, please refer to <a href="http://www.math.usm.edu/lambers/mat419/lecture10.pdf">this resume</a>.<br>
##### Sample execution
Minimize f(x,y):=x^2+xy+y^2-9x-9y+27<br>
Note that this function is strongly convex. Thus, if the gradient of the function f at the point (x^\*,y^\*) is a zero vector, the point is the unique optimal solution.
```
$ ./steepest_descent
 Number of variables:
2
 Maximum number of iterations:
100
 convergence criteria:
0.00001
 stepsize:
0.1
 initial point:
     X(1)=2
     X(2)=2
Optimal value:    0.0000
Number of iterations: 38
 Optimal solution:
      3.0000
      3.0000
$
```
