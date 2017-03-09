function y = second_grade_poly_solver(a,b,c)
%Solves a polynomial of grade 2 with those parameters
%   Detailed explanation goes here
    
temp = b.pow(2);
temp2 = a.multiply(c).multiply(java.math.BigDecimal('4'));
D = temp.subtract(temp2);
y = [java.math.BigDecimal('0'),java.math.BigDecimal('0')];
if D.compareTo(java.math.BigDecimal('0')) >= 0
    
    %computes the parameters to call the sqrt
    sqrt_dig = java.math.BigDecimal('500');
    sqrt_pre = java.math.BigDecimal('10').pow(sqrt_dig.intValue());
    xn = java.math.BigDecimal('1');
    precision = java.math.BigDecimal('1').divide(sqrt_pre);
    
    D = sqrt_BigDecimal(D,xn,precision,sqrt_dig,sqrt_pre);
    tempD = D.toBigInteger();
    D = java.math.BigDecimal(tempD.toString());
    temp = b.negate();
    temp = temp.add(D);
    y(1) = temp.divide(a.multiply(java.math.BigDecimal('2')));
    display(y(1));
    temp = b.negate();
    temp = temp.subtract(D);
    y(2) = temp.divide(a.multiply(java.math.BigDecimal('2')));
    display(y(2));
    
end;

end

