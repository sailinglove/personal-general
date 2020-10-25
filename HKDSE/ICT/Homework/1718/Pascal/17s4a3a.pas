program dateValidor;
(* Programmer Name  : Ivan Xiang
   Class            : S.4B
   Class No.        : 31
   Compiling Date   : 12th Oct, 2017
   Program File Name: 17s4a3a.pas
   Purpose          :
*)

var
  y, m, d, md : integer; //set up variables for validation
  v           : boolean;
  s           : string;

begin
  v := true;
  write('Enter a date (year month day) : ');
  readln(y, m, d);
  //check the year of the date if it fit the range.
  if y < 1 then
    v := false
  else
  //check the day of the date if it is too low. 
    if d < 1 then
      v := false
    else
  //check the day of the date if it fit the maximum date fit its month.
      case m of
        1, 3, 5, 7, 8, 10, 12 : md := 31;
        4, 6, 9, 11 : md := 30;
  //check weather the date is in a leap year.		
        2 : if ((y mod 400 = 0) and (y mod 100 <> 0)) or		
               ((y mod 100 <> 0) and (y mod 4 = 0)) then
              md := 29
            else
              md := 28;
        else v := false;
      end;
  if d > md then
    v := false;
  write('This date is ');
  if v then
    writeln('valid.')
  else
    writeln('invalid.');
  readln
end.