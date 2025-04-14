function stress_analysis()
% STRESS_ANALYSIS – Computes stress invariants, principal stresses, 
% and strain energy density for a 3D stress state in a steel structure.

% Input stress components (in Pascals)
sx = 82;    
sy = -104;
sz = -304;
txy = 76;
tyz = -38;
tzx = -152;

% Material properties
E = 210e9;   % Young's modulus (Pa)
v = 0.3;     % Poisson's ratio

% --- A1: Stress invariants ---
I1 = sx + sy + sz;
I2 = sx*sy + sy*sz + sz*sx - txy^2 - tyz^2 - tzx^2;
I3 = sx*sy*sz + 2*txy*tyz*tzx - sx*tyz^2 - sy*tzx^2 - sz*txy^2;

% --- A2: Hydrostatic stress ---
sh = I1 / 3;

% --- A3: Second deviatoric invariant & von Mises stress ---
J2 = I2 - (I1^2 / 3);
sv = sqrt(-3 * J2);

% --- A4: Principal stresses ---
coeff = [1, -I1, I2, -I3];
roots_polynomial = roots(coeff);
s1 = roots_polynomial(1);
s2 = roots_polynomial(2);
s3 = roots_polynomial(3);

% --- A5: Maximum shear stress ---
tmax = 0.5 * max([abs(s1 - s2), abs(s2 - s3), abs(s3 - s1)]);

% --- A6: Eigenvalues and eigenvectors ---
M = [sx, txy, tzx; txy, sy, tyz; tzx, tyz, sz];
[V, L] = eig(M);

% --- A7: Strain energy density ---
UdV = (1 / (2 * E)) * (I1^2 - 2 * (1 + v) * I2);

% --- Display results ---
fprintf('I1 = %.2f Pa\nI2 = %.2f Pa\nI3 = %.2f Pa\n', I1, I2, I3);
fprintf('Hydrostatic stress = %.2f Pa\n', sh);
fprintf('J2 = %.2f Pa\nVon Mises stress = %.2f Pa\n', J2, sv);
fprintf('Principal stresses: s1 = %.2f Pa, s2 = %.2f Pa, s3 = %.2f Pa\n', s1, s2, s3);
fprintf('Max shear stress = %.2f Pa\n', tmax);
fprintf('Strain energy density = %.2e J/m^3\n', UdV);
disp('Eigenvalues (principal stresses) and corresponding eigenvectors:');
disp(L);
disp(V);
end
