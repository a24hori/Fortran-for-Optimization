PROGRAM steepest_descent
!******************************************************
!* Steepest descent method for solving unconstrained  *
!* optimization problem:                              *
!*   Minimize  f(x),                                  *
!* where f:R^n -> R is continuously differentiable.   *
!* --- Parameters ----------------------------------- *
!*  NMAX: upper bound on the number of variables.     *
!*                                                    *
!* --- User's inputs -------------------------------- *
!*  n: number of variables (n.LE.NMAX).               *
!*  kmax: maximum number of iterations                *
!*  eps: convergence criteria                         *
!*  ss: stepsize (this could be obtained by the line  *
!*     search algorithm and guaranteed the global     *
!*     convergence by applying Armijo criterion or    *
!*     Wolfe criterion, however, since this program   *
!*     is just a test for my first Fortran, I did     *
!*     not implement the line search algorithm).      *
!*  x0(i): initial point.                             *
!*               Prepared by A. Hori, September 2017. *
!******************************************************

	integer,parameter :: NMAX = 10
	integer :: n = 2, steps

	real(8) :: x0(NMAX),optx(NMAX),optval,eps,ss,appnablaf(NMAX)

	print *, 'Number of variables:'
	read *, n
	print *, 'Maximum number of iterations:'
	read *, kmax
	print *, 'Convergence criteria:'
	read *, eps
	print *, 'Stepsize:'
	read *, ss
	print *, 'Initial point:'
	do i = 1,n
		write(*,100,advance='no') i
		read *, x0(i)
	end do

	100 format('     X(',i0,')=')

	call steepDA(n,kmax,eps,ss,x0,optval,optx,steps)

	print '("Optimal value:",f10.4)', optval
	print '("Number of iterations: ",i0)', steps
	print *, 'Optimal solution:'
	do i = 1,n
		print '(2x,f10.4)', optx(i)
	end do

END PROGRAM steepest_descent

!******************************************************
!* Steepest descent algorithm                         *
!* -------------------------------------------------- *
!* Parameters:                                        *
!*  -- User input ---------------------------------   *
!*  kmax: max. number of iterations.                  *
!*  eps: convergence criteria.                        *
!*  ss: stepsize.                                     *
!*  x0(i): initial point.                             *
!******************************************************

subroutine steepDA(n,kmax,eps,ss,x0,f_star,x_star,steps)
	real(8) :: eps,ss,x(n),x0(n),x_star(n),f_star
	real(8) :: gradf(n)
	integer :: k,steps

	x = x0 ! initialization

	do k = 1,kmax
		call diff(n,x,gradf) ! compute approx. gradient
		if (norm2(gradf)<eps) then
			x_star = x
			call f(n,x_star,f_star)
			exit
		end if
		x = x - ss*gradf ! compute descent direction
	end do
	steps = k
	return
end


!******************************************************
!* Approximate gradient of f by calculating the       *
!*  secant between f(x+dx) and f(x-dx), and divided   *
!*  by 2*dx, where dx is an efficiently small value.  *
!* This technique is called a finite-difference       *
!*  approximation.                                    *
!******************************************************

subroutine diff(n,x,appnablaf)
	real(8) :: x(n),y(n),appnablaf(n)
	real(8) :: dx,f1,f2

	data dx/1.0d-4/

	do i = 1,n
		y = x
		y(i) = x(i) + dx
		call f(n,y,f1)
		y(i) = x(i) - dx
		call f(n,y,f2)
		appnablaf(i) = (f1-f2)/(2.0*dx)
	end do
	return
end

!******************************************************
!* Objective function and its gradient (df:option)    *
!******************************************************

subroutine f(n,x,fval)
	real(8) :: x(n),fval
!--- f(x) (user supplied)
	fval = x(1)**2 + x(1)*x(2) + x(2)**2 - 9*x(1) - 9*x(2) + 27
	return
end

subroutine df(n,x,nablaf)
	real(8) :: x(n),nablaf(n)
!--- nabla f(x) (explicit expression, user supplied)
	nablaf = (/ 2*x(1) + x(2) - 9 , 2*x(2) + x(1) - 9 /)
	return
end
