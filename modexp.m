function y = modexp(n,e,x);

y = 1;
base = mod(x,n);
while e > 0    
    if mod(e,2) == 1
        y = mod((y * base),n);
    end;
    e = floor(bitsra(e,1));
    base = mod((base * base),n);    
end;

return;
