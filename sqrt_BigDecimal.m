function y = sqrt_BigDecimal(c,xn,precision,sqrt_dig,sqrt_pre)
%   Computes the sqrt of a big decimal
%   Author:Luciano Culacciatti 
%   url: http://www.codeproject.com/Tips/257031/Implementing-SqrtRoot-in-BigDecimal

fx = xn.pow(2).add(c.negate());
fpx = xn.multiply(java.math.BigDecimal('2'));
xn1 = fx.divide(fpx,2*sqrt_dig.intValue(),java.math.RoundingMode.HALF_DOWN);
xn1 = xn.add(xn1.negate());

currentSquare = xn1.pow(2);
currentPrecision = currentSquare.subtract(c);
currentPrecision = currentPrecision.abs();

if currentPrecision.compareTo(precision) <= -1
   y = xn1;
   return;
end;
y = sqrt_BigDecimal(c,xn1,precision,sqrt_dig,sqrt_pre);
end

