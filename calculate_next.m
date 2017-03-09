function y = calculate_next(p,a)
%CALCULATE_NEXT_P It calculates the next p/q of the fraction


y(3) = a.multiply(p(2)).add(p(1));
y(1) = p(2);
y(2) = y(3);

end

