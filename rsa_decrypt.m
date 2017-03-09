function y = rsa_decrypt(p,q,e,c)
    
    p = java.math.BigDecimal(p);
    q = java.math.BigDecimal(q);
    e = java.math.BigDecimal(e);
    c = java.math.BigDecimal(c);
    
    n = p.multiply(q);
    n2 = p.subtract(java.math.BigDecimal('1'));
    n2 = n2.multiply(q.subtract(java.math.BigDecimal('1')));
    d = find_inverse_modulo(e.toPlainString(),n2.toPlainString());
    
    y = modexptrialjava(d.toPlainString(),c.toPlainString(),n.toPlainString());
return;