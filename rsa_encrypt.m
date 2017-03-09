function y = rsa_encrypt(p,q,e,m)
    
    p = java.math.BigDecimal(p);
    q = java.math.BigDecimal(q);
    e = java.math.BigDecimal(e);
    m = java.math.BigDecimal(m);
    
    n = p.multiply(q);
    n2 = p.subtract(java.math.BigDecimal('1'));
    n2 = n2.multiply(q.subtract(java.math.BigDecimal('1')));
    
    y = modexptrialjava(e.toPlainString(),m.toPlainString(),n.toPlainString());

return;

