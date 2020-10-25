program quadraticGraphGenerator;
  (* Programmer Name  : Ivan Xiang
   Class            : S.4B
   Class No.        : 31
   Compiling Date   : 29th Sept., 2017
   Program File Name: 17s4a2a - for.pas
   Purpose          : This program will generate a graph showing the  solves of
                      a quadratic equation the user give.
  *)

var
  a, b, c, x, y : integer; //setup varibles for calculation

begin
  write('Enter the a, b and c for the equation y = a*x*x + c : ');
  readln(a, b, c);
  //generate the graph of the quadratic equation using 'for loop'
  writeln('x':3);
  for x := -4 to 4  do
    begin
      //calculate the solves of the equation
      y := a*x*x + b*x + c;
      writeln(x:2, '|', '*':y+10, y:60-y);
    end;

  writeln('--+------------------------------------------------------------- y');
  writeln('  |00000000000000000001111111111222222222233333333334444444444');
  writeln('  |98765432101234567890123456789012345678901234567890123456789');
  writeln('');
  //calculate the roots of the equation
  writeln('When y is 0, x is', ((-b + sqrt(b*b - 4*a*c))/(2*a)):7:3);
  writeln('or':17, ((-b - sqrt(b*b - 4*a*c))/(2*a)):7:3);
  readln
end.
