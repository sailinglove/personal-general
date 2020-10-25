program y17s4a5b;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 5th Apr., 2018
  Program File Name: y17s4a5b.pas
  Purpose          : This program generate 15 lucky numbers for 3 prizes and
                     allows user to input his/her ticket no., and compare the
                     last 3 digits of the no. with the lucky numbers, if the
                     numbers match, the program will tell him/her which prize
                     does he/she gets.}

var
  rn : array[1..3, 1..5] of integer; //2D array to store the lucky numbers
  i, j : integer;  //counters the operation of the 2D array
  a, b : integer;  //counters the operation of the copy of the 2D array
  n : integer;     //storage var. for the user's input
  o : boolean;     //storage var. for the repeat status
begin
  randomize;

  {initialize the array to prevent the repeat-checker found false repeat
   (i.e. initial value of the var., not the random value)}
  for i := 1 to 3 do
    for j := 1 to 5 do
      rn[i, j] := -1;

  for i := 1 to 3 do
    for j := 1 to 5 do
      begin
        repeat
          rn[i, j] := random(999) + 1;
          o := false;
          for a := 1 to 3 do
            for b := 1 to 5 do

              {repeat-checker checking if the number just generated is the same
               with previous number, if yes, then change the repeat status
               storage to 'true'}
              if ((i <> a) and (j <> b) and (rn[i, j] = rn[a, b])) then
                o := true;

        {if the checker found positive outcome, the loop will not exit until
         suitable value is generated}
        until (o = false);
      end;

  for i := 1 to 3 do
    begin
      write('No. ', i, ' Prize : ');
      for j := 1 to 4 do
        write(rn[i, j]:5);
      writeln(rn[i, 5]:5);
    end;

  //valid the input to the range
  repeat
    write('Enter your ticket number (1-9999) : ');
    readln(n);
  until (n > 0) and (n < 10000);

  n := n mod 1000; //obtain the last 3 digits

  //check if the no. match with lucky numbers and if yes, which prize.
  for i := 1 to 3 do
    for j := 1 to 5 do
      if (n = rn[i, j]) then
        begin
          writeln('No. ', i, ' Prize !!!');
          break;
        end;

  readln
end.
