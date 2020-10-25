program s5a1a;
  (*Programmer Name  : Ivan Xiang
    Class            : S.5B
    Class No.        : 31
    Compiling Date   : 21st Sept., 2018
    Program File Name: s5a1a.pas
    Purpose          : This program accept the name, sex and HKID no. of the
                       user and display whethwe the user has input a valid or
                       invalid HKID no.*)

var  //global variables
  n, id, idn : string;
  //n: name of the user; id: HKID no. of the user; idn: digit 2-6 of the HKID no
  s, con : char;  //s: sex of the user, con: continue checker
  i : integer;  //i: see below
  valid : boolean;  //variable for validation

procedure init;  //procedure to initialize the algorithm
  begin
    con := 'y';  //set con to be 'y' to executethe algorithm
    valid := true;  //set valid to be true to prevent inproper validation.
  end;

procedure name;
//procedure to accept the name of the user and change it all to capital letter
  begin
    write('Enter your name : ');
    readln(n);
    for i := 1 to length(n) do  (*repeat the following command for each
                                  character of the string*)
      if (n[i] >= 'a') and (n[i] <= 'z') then
      //if the character is lower case execute the following command
        n[i] := chr( ord(n[i]) - 32 );  //change lower case to upper case
  end;

procedure sex;  //procedure to accept and validate the sex of the user
  begin
    repeat  //repeat the following coommand until the sex is in correct format
      write('Enter your sex : ');
      readln(s);
    until (s = 'f') or (s = 'F') or (s = 'm') or (s = 'M');
  end;

procedure chkDig(cid : string; var v : boolean);
//procedure to perform the check digit algorthm of HKID
  var  //local variables
    num : array[1..8] of integer;
    // array ofintegers to store the numbers in HKID no.
    err, j, sum : integer;  //err: store the error code of procedure val();
    //j: counter; sum: sum of the numbers
  begin
    num[8] := ord(cid[1]) - 64;
    //change the first letter of the HKID in to number as if A=1
    j := 2;  //initialize j
    for i := 7 downto 2 do  //repeat the following command for digit 2 to 7
      begin
        val(cid[j], num[i], err);  //change the number from character to integer
        j := j + 1;  //increase the counter for next operation
      end;
    if cid[9] <> 'A' then  //special case for check digit = 10 i.e. 'A'
      val(cid[9], num[1], err)  //if <> 'A' proceed as normal
    else
      num[1] := 10;  //if = 'A' then check digit = 10
    sum := 0;
    for i := 8 downto 1 do  //calculate the sum of the numbers * their weight
      sum := sum + (num[i] * i);
    if (sum mod 11) <> 0 then
    //if 11 is a factor of the sum then this HKID is valid
      v := false;
  end;

procedure hkid;
//procedure to accept the HKID and prepare for check digit algorithmv
  var  //local variable
    ide : integer;  //error code for procedure val()
  begin
    write('Enter your HKID : ');
    readln(id);
    if length(id) <> 10 then  //HKID must have a lenght of 10
      valid := false;
    if (id[1] <= 'A') or (id[1] >= 'Z') then
    //first digit of HKID must be a capital letter
      valid := false;
    if (id[8] <> '(') or (id[10] <> ')') then
    //the 8th and 10th place of HKID must be '(' and ')'
      valid := false;
    idn := copy(id, 2, 6);  //extract digit 2 to 7 of the HKID
    val(idn, i, ide);  //check if digit 2 to 7 are integers
    if (ide <> 0) and not(((id[9] > '0') and (id[9] < '10')) or (id[9] = 'A'))
    //check if digit 2 to 7 are integers and check digit is 1~9 or A
    then
      valid := false
    else
      chkDig(id, valid);
  end;

procedure mes(na : string; se : char; va : boolean);
//procedure to show the final message
  begin
    if (se = 'f') or (se = 'F') then
    //determine the title of the user to be male or female
      write('Miss ')
    else
      write('Mr. ');
    write(na, ' has entered ');
    if va = false then  //determine the HKID no. is valid or not
      write('an invalid')
    else
      write('a valid');
    writeln(' HK ID no.');
  end;

begin  //main program starts
  init;
  while (con = 'Y') or (con = 'y') do  //check if continue or not
    begin
      name;              (*
      sex;                  to invoke
      hkid;                   the procedures
      mes(n, s, valid);  *)
      write('Continus (Y/N) ? ');  //ask if the user want to continue
      readln(con);
    end;
end.