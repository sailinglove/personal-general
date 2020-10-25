program s4a7b;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 16th May, 2018
  Program File Name: 17s4a7b.pas
  Purpose          : This program accept a binary value and a decimal value from
                     user and translate them into decimal and binary format.}

var             //global varible
  a : string;   //binary number given by user
  c : integer;  //decimal number given by user

procedure BinToDec (b : string);  //procedure to translate binary to decimal
  var                //local varible
    i, r : integer;  //i: counter for loop; r: result in decimal
  begin
    r := 0;  //initialise the varible
    for i := 1 to length(b) do  //translate binary to decimal by multiplication
      if b[i] = '1' then
        r := r*2 + 1
      else
        r := r*2;
    writeln('The decimal value is ',r , '.');
  end;

procedure DecToBin (d : integer);  //procedure to translate decimal to binary
  var             //local varible
    s : string;   //result in binary
    i : integer;  //counter for loop
  begin
    s := '';  //initialise the varible
    while d > 0 do  //translate decimal to binary format by division
      begin
        if (d mod 2) = 1 then
          s := '1' + s
        else
          s := '0' + s;
        d := d div 2;
      end;
    writeln('The binary value is ', s, '.');
  end;

begin
  write('Enter a binary number : ');
  readln(a);
  BinToDec(a);  //calling binary to decimal procedure
  write('Enter a decimal number : ');
  readln(c);
  DecToBin(c);  //calling decimal to binary procedure
  readln
end.
