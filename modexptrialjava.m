function y = modexptrialjava(e,x,n)
%does the exponentiation of x on power e modulo n
n = java.math.BigDecimal(n);
e = java.math.BigDecimal(e);
x = java.math.BigDecimal(x);

y = java.math.BigDecimal('1');
base = x.remainder(n);

while (e.compareTo(java.math.BigDecimal(0)) > 0)
    %If exponent mod 2 == 1 
    temp = e.remainder(java.math.BigDecimal(2));
    if temp.compareTo(java.math.BigDecimal(1)) == 0
        %result = result * base mod n
        temp = y.multiply(base);
        y = temp.remainder(n);
    end;
    %e = e div 2
    e = e.divideToIntegralValue(java.math.BigDecimal(2));
    %base = base^2 mod n
    temp = base.multiply(base);
    base = temp.remainder(n);
    
end;

return;

