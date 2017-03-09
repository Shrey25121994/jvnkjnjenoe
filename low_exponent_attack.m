function y = low_exponent_attack(e,n)
%Implements the low exponent attack (Wiener Theorem)
%Giving the function the e and n it factorises n
tic;
%Finds the cont fraction of e/n
A = cont_fraction(e,n);

e = java.math.BigDecimal(e);
n = java.math.BigDecimal(n);

%These are the starting standard q-2,p-2,q-1,p-1
p(1) = java.math.BigDecimal('0');
p(2) = java.math.BigDecimal('1');
q(1) = java.math.BigDecimal('1');
q(2) = java.math.BigDecimal('0');


%the flag exists so that when we correctly factor n the programm stops
flag = true;
l = A.length();
i = 2;
while(flag && i<=l)
    
    %The loop is done every two step so it has to claculate the middle step
    p = calculate_next(p,java.math.BigDecimal(A(i-1)));
    q = calculate_next(q,java.math.BigDecimal(A(i-1)));
    
    %find q,p and if q not odd go to next loop
    q = calculate_next(q,java.math.BigDecimal(A(i)));
    p = calculate_next(p,java.math.BigDecimal(A(i)));

    
    remain = q(3).remainder(java.math.BigDecimal('2'));
    if remain.compareTo(java.math.BigDecimal('1')) == 0
          
        %check if c is integer and then find it
        temp = e.multiply(q(3));
        temp = temp.subtract(java.math.BigDecimal('1'));
        if temp.remainder(p(3)).compareTo(java.math.BigDecimal('0')) == 0
            c = temp.divide(p(3));
            %call the polynomial solver
            aPoly = java.math.BigDecimal('1');
            bPoly = n.subtract(c);
            bPoly = bPoly.add(java.math.BigDecimal('1'));
            bPoly = bPoly.negate();
            cPoly = n;
            temp = second_grade_poly_solver(aPoly,bPoly,cPoly);
            
            %if it is already factorised return
            if temp(1).multiply(temp(2)).compareTo(n) == 0
                
                y(1) = temp(1).toPlainString();
                y(2) = temp(2).toPlainString();
                toc;
                return;
            end;
        end;
    end;
    %add 2 because there is no need to check half of the factors because
    %they are bigger than e/n
    i = i + 2;
    display('ok');
    
end;

end

