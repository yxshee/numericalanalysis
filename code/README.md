# 📂 Code Directory – Numerical Analysis Algorithms

Welcome to the `code` folder! Here you'll find MATLAB implementations of core numerical analysis algorithms, each organized by experiment and designed for clarity, reusability, and demonstration.

---

## 📦 Directory Structure

```
code/
├── exp1_bisection_fixedpoint.m         # Bisection & Fixed-Point Iteration
├── exp2_newton_secant.m                # Newton & Secant Methods
├── exp3_gauss_elimination.m            # Gaussian Elimination
├── exp4_lu_factorization.m             # LU Factorization (Doolittle)
├── exp5_gauss_seidel_sor.m             # Gauss-Seidel & SOR Iterative Solvers
├── exp6_power_method.m                 # Power Method for Eigenvalues
├── exp7_lagrange_interpolation.m       # Lagrange Polynomial Interpolation
├── exp8_newton_divided_difference.m    # Newton’s Divided Difference Interpolation
├── exp9_numerical_quadrature.m         # Trapezoidal & Simpson’s Rules
├── exp10_euler_rk4.m                   # Modified Euler & RK4 for ODEs
└── Readme.md                           # This documentation file
```

---

## 🧮 Algorithm Highlights

| Experiment | Method(s) Implemented                | Purpose / Application                        |
|:----------:|:-------------------------------------|:---------------------------------------------|
| **1**      | Bisection, Fixed-Point Iteration     | Root finding for nonlinear equations         |
| **2**      | Newton, Secant                       | Fast root finding for nonlinear equations    |
| **3**      | Gaussian Elimination                 | Solving linear systems                       |
| **4**      | LU Factorization (Doolittle)         | Matrix decomposition for linear systems      |
| **5**      | Gauss-Seidel, SOR                    | Iterative solvers for linear systems         |
| **6**      | Power Method                         | Dominant eigenvalue/eigenvector computation  |
| **7**      | Lagrange Interpolation               | Polynomial interpolation                     |
| **8**      | Newton Divided Difference            | Polynomial interpolation                     |
| **9**      | Trapezoidal, Simpson’s Rule          | Numerical integration                        |
| **10**     | Modified Euler, RK4                  | Solving ordinary differential equations      |

---

## 🖥️ How to Use

1. **Open MATLAB** and navigate to this `code` directory.
2. **Run any script** (e.g., `exp3_gauss_elimination.m`) directly.  
   Each file contains:
   - **Reusable functions** for the numerical method(s)
   - **Demo section** at the end showing example usage and output

   Example (from `exp1_bisection_fixedpoint.m`):
   ```matlab
   % Find sqrt(29) using bisection
   f = @(x) x.^2 - 29;
   root = bisection(f, 5, 6, 1e-6, 100);
   fprintf('sqrt(29) ≈ %.8f\n', root);
   ```

3. **Modify demo parameters** or functions as needed to experiment with your own problems.

---

## 📊 Visual Example: Bisection Method

```
a ──●────────────●────────────●── b
     |            |            |
    f(a)         f(c)         f(b)
```
*The interval [a, b] is repeatedly halved until the root is found within the desired tolerance.*

---

## 📚 Further Reading

- For a high-level overview and project details, see the main [README](../README.md).
- Each script is documented with comments and example usage.

---

## 📝 License

All code is provided under the [Apache License 2.0](../LICENSE).

---

*Happy computing! For questions or contributions, see the main repository page.*