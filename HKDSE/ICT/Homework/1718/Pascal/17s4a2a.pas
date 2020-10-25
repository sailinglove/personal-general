program largeIntegerCalculator;
  (* Programmer Name  : Ivan Xiang
   Class            : S.4B
   Class No.        : 31
   Compiling Date   : 29th Sept., 2017
   Program File Name: 17s4a2a.pas
   Purpose          : This program calculate the product of two large integer
                      which has 8 digit.
  *)

var
  a, b, a1, a2, b1, b2, r1, r2, c : integer; //setup variables for calculation
  s                               : string;  //setup variables for calculation

begin
  write('Enter two integer (smaller than 100000000): ');
  readln(a, b);

  //divide inputs to two 4-digit number  separately for easier calculation
  a1 := a div 10000;
  a2 := a mod 10000;
  b1 := b div 10000;
  b2 := b mod 10000;

  (*calculate the product separately in two 8-digit number as the capacity of
    the data type is limited*)
  r1 := a1 * b1 + ((a1 * b2 + a2 * b1) div 10000);
  r2 := a2 * b2 + ((a1 * b2 + a2 * b1) mod 10000 *10000);
  r1 := r1 + r2 div 100000000;
  r2 := r2 mod 100000000;
  r2 := 100000000 + r2;

  //add placeholder(s)(0) for the second output if the is any empty place
  str(r2, s);
  s := copy(s, 2, 8);
  writeln('Their product is ', r1, s, '.');
  readln
end.
