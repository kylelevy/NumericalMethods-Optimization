function x = PLUSolver(L, U, P, b)

b = P*b.';
Y = L\b;
x = U\Y;

end