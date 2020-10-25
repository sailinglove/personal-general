program s5a1b;
  (*Programmer Name  : Ivan Xiang
    Class            : S.5B
    Class No.        : 31
    Compiling Date   : 23st Sept., 2018
    Program File Name: s5a1b.pas
    Purpose          : This program interpret input Pascal functions including
                       sin(), cos() and exp(), validate and execute them.*)

var  //global variables
  input, s1, s2 : string;  //input: user's input
  //s1: function part of the input; s2: number part of the input
  i : integer; //counter
  value : real;  //store the numbers
  validE, validF : boolean;  //validE: variable for function validation
  //validF: variable for format validation

procedure validation;  //procedure to validate the function and its format
  var  //local variable
    err : integer;  //error code for procedure val()
  begin
    validE := true;  //innitialize the variable
    validF := true;  //innitialize the variable
    if (s1 <> 'sin') and (s1 <> 'cos') and (s1 <> 'exp') then
    //validate the functions (fixed value check)
      begin
        writeln('Invalid function!!!');
        validE := false;
        exit;  //exit this procedure
      end;
    if (input[4] <> '(') or (input[length(input)] <> ')') then
    //the 4th and last place of the input must be '(' and ')'
      validF := false;
    val(s2, value, err);
    //check if the number are all real numbers and change it from string to real
    if err <> 0 then
      validF := false;
    if s1 = 'exp' then  //exp(1) is invalid format due to special request
      begin
        if value = 1 then
          validF := false;
      end;
    if validF = false then
      writeln('Invalid format!!!');
  end;

function a2r : real;
//function to change degree measure to radian
  begin
    a2r := (pi / 180) * value;  //the algorthm for degree to radian
  end;

procedure output;  //procedure to calculate and output the result
  begin
    write('The result is ');
    if s1 = 'cos' then
      writeln(cos(a2r):0:4, '.');  //execute cos() function
    if s1 = 'sin' then
      writeln(sin(a2r):0:4, '.');  //execute sin() function
    if s1 = 'exp' then
      writeln(exp(value):0:4, '.');  //execute exp() function
  end;

begin  //main program starts
  repeat  //repeat the program endlessly
    write('Enter a function with parameter (cos/sin/exp/exit) : ');
    readln(input);
    s1 := copy(input, 1, 3);  //extract the function part of the input
    s2 := copy(input, 5, length(input) - 5);
    //extract the number part of the input
    if input = 'exit' then  //exit the program if the user choose to
      break;
    validation;  //invoke procedure validation
    if (validE = true) and (validF = true) then
    //invoke procedure output if both the function and the format is correct
      output;
  until false;
  write('Goodbye!!!');
  for i := 1 to 600000000 do  //delay loop
    write;
end.
