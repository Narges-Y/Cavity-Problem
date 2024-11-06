# Cavity Flow Problem
Solving the Cavity Flow Problem Using Streamfunction-Vorticity Formulation (Fortran Program)


In this study, the Navier-Stokes equations are solved for a fluid within a square cavity with a moving lid.

![X3SX0TFAe9D80fWr3QTN4PU7](https://github.com/user-attachments/assets/32c5ece0-ee56-40ba-8ba8-c7aa10d87bb8)

## Equations

$$ \omega = - (\frac{\partial^2 \psi}{\partial x^2} + \frac{\partial^2 \psi}{\partial y^2}) $$

$$ \frac{\partial \omega}{\partial t} + u \frac{\partial \omega}{\partial x} + v \frac{\partial \omega}{\partial y} = \nu \left( \frac{\partial^2 \omega}{\partial x^2} + \frac{\partial^2 \omega}{\partial y^2} \right) $$

$$ \textit{Steady} \rightarrow u\left(\frac{\partial \omega}{\partial x}\right) + v\left(\frac{\partial \omega}{\partial y}\right) = \nu\left(\frac{\partial^2 \omega}{\partial x^2} + \frac{\partial^2 \omega}{\partial y^2}\right) $$

$$ u = \frac{\partial \psi}{\partial y}, \quad v = -\frac{\partial \psi}{\partial x} $$

## Boundary Conditions

$$ v_{\text{tangential}} = v_{\text{wall}} $$ $$ v_{\text{normal}} = 0 $$

$$ \frac{\partial v_{\text{normal}}}{\partial x_{\text{tangential}}} = 0 $$

![b9SJPXR0T8CSKWMDLeQ7AXKB(1)](https://github.com/user-attachments/assets/1f809050-634b-45a9-a2bc-1a9d10fbe81d)

## Grid Generation

$$ \Delta x = \frac{L}{n - 1} \rightarrow x(i) = (i - 1) \Delta x $$
$$ \Delta y = \frac{H}{m - 1} \rightarrow y(j) = (j - 1) \Delta y $$

$$ \beta = \frac{\Delta x}{\Delta y} $$

## Results

#### Omega Contour (ω)
![Fortran_L_20241103_144010_3](https://github.com/user-attachments/assets/70c3438c-9891-4394-9ff1-cb9e5af46998)

#### Psi Contour (Ψ)
![Fortran_L_20241103_144010_2](https://github.com/user-attachments/assets/d672b5f4-22bf-43f0-8082-fddd012a2d6b)

#### Velocity Contours (u,v)
![Fortran_L_20241103_144010_5](https://github.com/user-attachments/assets/1ec2989d-f412-42a1-977b-14daf115ae24)

![Fortran_L_20241103_144010_4](https://github.com/user-attachments/assets/a41c903c-3d5e-48ae-b0b9-188ed7fffaaa)
