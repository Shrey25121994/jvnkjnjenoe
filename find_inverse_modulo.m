function y = find_inverse_modulo(e,n)

n = java.math.BigDecimal(n);
e = java.math.BigDecimal(e);

t = java.math.BigDecimal('0');
t2 = java.math.BigDecimal('1');
r = n;
r2 = e;

%if r2 > 0
while (r2.compareTo(java.math.BigDecimal('0')) > 0)
    %q := r div r2
    q = r.divideToIntegralValue(r2);
    %t := t2 , t2 := t - q*t2
    temp = t;
    t = t2;
    t2 = temp.subtract(q.multiply(t2));
    % r := r2 , r2 := r -q*r2
    temp = r;
    r = r2;
    r2 = temp.subtract(q.multiply(r2));
end;

%if r > 1 not invertible
if r.compareTo(java.math.BigDecimal('1')) > 0
    y = java.math.BigDecimal('0');
end;

%if t < 0 then t := t + n
if t.compareTo(java.math.BigDecimal('0')) < 0 
    t = t.add(n);
end;

y = t;
return;

