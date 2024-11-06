# Cavity Flow Problem
Solving the Cavity Flow Problem Using Streamfunction-Vorticity Formulation (Fortran Program)


In this study, the Navier-Stokes equations are solved for a fluid within a square cavity with a moving lid.

![X3SX0TFAe9D80fWr3QTN4PU7](https://github.com/user-attachments/assets/32c5ece0-ee56-40ba-8ba8-c7aa10d87bb8)

## Equations

$$ \omega = - (\frac{\partial^2 \psi}{\partial x^2} + \frac{\partial^2 \psi}{\partial y^2}) $$

$$ \frac{\partial \omega}{\partial t} + u \frac{\partial \omega}{\partial x} + v \frac{\partial \omega}{\partial y} = \nu \left( \frac{\partial^2 \omega}{\partial x^2} + \frac{\partial^2 \omega}{\partial y^2} \right) $$

$$ \text{Steady} \rightarrow u \left( \frac{\partial \omega}{\partial x} \right) + v \left( \frac{\partial \omega}{\partial y} \right) = \nu \left( \frac{\partial^2 \omega}{\partial x^2} + \frac{\partial^2 \omega}{\partial y^2} \right) $$

$$ u = \frac{\partial \psi}{\partial y}, \quad v = -\frac{\partial \psi}{\partial x} $$

## Boundary Conditions

$$ v_{\text{tangential}} = v_{\text{wall}} $$ $$ v_{\text{normal}} = 0 $$

$$ \frac{\partial v_{\text{normal}}}{\partial x_{\text{tangential}}} = 0 $$
![b9SJPXR0T8CSKWMDLeQ7AXKB(1)](https://github.com/user-attachments/assets/1f809050-634b-45a9-a2bc-1a9d10fbe81d)
