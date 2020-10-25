program s4a7a;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 14th May, 2018
  Program File Name: 17s4a7a.pas
  Purpose          : This program accept the amount money saved every year and
                     calculate the compound interests of three user-defined
                     period, and how many years is required for the user to be a
                     millionaire.}

var                           //global variable
  j : integer;                //counter for loop
  A, r : real;                //A: amount of money saved, r: interest rate
  n : array[1..4] of integer;  {numbers for periods, n[4] is used to calculate
                                the years need to reach million.}

function power(y : integer; x : real) : real;  //function to calculate power.
  var             //local varibles
    re : real;    //result
    i : integer;  //counter for loop
  begin
    re := 1;            //initialise the varible
    for i := 1 to y do  //calculate the power
      re := re * x;
    power := re;
  end;

function findamount(a, i : real; n : integer) : real;  {function to find the
                                                        amount after a period}
  var             //local varibles
    re : real;    //result
    b : integer;  //counter for loop
  begin
    re := 0;      //initialise the varible
    for b := 1 to n do  //calculate the amount by calling the power function
      re := re + power(b, (1 + i/100));
    findamount := re * a;
  end;

begin
  write('Enter the sum of money saved every year : ');
  readln(A);
  write('Enter the compound interest rate : ');
  readln(r);
  write('Enter 3 different periods (in years) : ');
  readln(n[1], n[2], n[3]);
  writeln('Year          Amount');
  writeln('----          ------');
  for j := 1 to 3 do  //use the findamount function to find the amount
      writeln(n[j]:3, findamount(A, r, n[j]):17:2);
  n[4] := 0;
  repeat  //find the years required for the amount to grow to 1 million
    n[4] := n[4] + 1;
    findamount(A, r, n[4]);
  until findamount(A, r, n[4]) > 1000000;
  writeln('After ', n[4], ' years you will be a millionaire!');
  readln
end.
