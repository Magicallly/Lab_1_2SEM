program lab1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  SysUtils;

const
  N = 1000;

type
  TCustomer = Record
    number: integer;
    pole: string[13];
    flag: boolean;
  end;

  Tmass = array [1 .. N] of TCustomer;

procedure Zapolnenie(var Tarray: Tmass);
var
  i: integer;
begin
  for i := 1 to N do
  begin
    Tarray[i].number := random(201);
    Tarray[i].pole := 'my_test_' + IntToStr(i);
    Tarray[i].flag := false;
  end;
end;

procedure Output(const A: Tmass);
var
  i: integer;
begin
  for i := 1 to N do
  begin
    with A[i] do
    begin
      writeln(number:5, pole:14, flag:7);
    end;
  end;
end;

procedure Swap(var A, B: TCustomer);
var
  temp: TCustomer;
begin
  temp := A;
  A := B;
  B := temp;
end;

procedure Sort_Numbers(var A: Tmass); // сорт. выбор.
var
  i, j, min: integer;
begin
  for i := 1 to N - 1 do

  begin
    min := i;
    for j := i + 1 to N do

    begin
      if A[j].number < A[min].number then
        min := j
      else if A[j].number = A[min].number then
        if A[j].pole < A[min].pole then
          min := j;
    end;
    Swap(A[i], A[min]);
  end;
end;

procedure Sort_pole(var A: Tmass);
var
  i, j, min: integer;
begin

  for i := 1 to N - 1 do
  begin
    min := i;
    for j := i + 1 to N do
      if (A[j].pole < A[min].pole) then
        min := j;
    Swap(A[i], A[min]);
  end;
end;

function NumberOfTrue(var A: Tmass): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 1 to N do
  begin
    if (A[i].flag = True) then
      Inc(Result);
  end;
end;

procedure MakeAllFalse(var A: Tmass);
var
  i: integer;
begin
  for i := 1 to N do
  begin
    A[i].flag := false;
  end;
end;

procedure BinarySearch_POLE(var A: Tmass; const element: string);
var
  left, right, mid: integer;
  flag: boolean;

begin

  left := 1;
  right := N;
  flag := True;
  while (left <= right) and flag do
  begin
    mid := (left + right) div 2;
    A[mid].flag := True;
    if (A[mid].pole = element) then
      flag := false

    else
    begin
      if (A[mid].pole > element) then
        right := mid - 1
      else
        left := mid + 1;
    end;
  end;
  if flag then
    writeln('Not found')
  else
  begin
    writeln('Element index: ' + IntToStr(mid));
    writeln(A[mid].number:5, A[mid].pole:14, A[mid].flag:7);
  end;
end;

procedure BinarySearch_Numbers(var A: Tmass; const element: integer);
var
  left, right, middle, temp: integer;
  flag: boolean;
begin
  left := 1;
  right := N;
  flag := True;
  while (left <= right) and flag do
  begin
    middle := (left + right) div 2;
    A[middle].flag := True;
    if ((A[middle].number) = element) then
      flag := false
    else
    begin
      if (A[middle].number > element) then
        right := middle - 1
      else
        left := middle + 1;
    end;
  end;
  if flag then
    writeln('Not found')
  else
  begin
    temp := middle;
    while (A[temp].number = element) and (temp<>1) do
    begin
      Dec(temp);
    end;
    A[temp].flag := True;
    Inc(temp);

    while (A[temp].number = element) and (temp<>n) do
    begin
      A[temp].flag := True;
      writeln(A[temp].number:5, A[temp].pole:14, A[temp].flag:7);
      Inc(temp);
      A[temp].flag := True;
    end;


  end;
end;

var
  MyArray: Tmass;
  s: string;
  val: integer;

begin
  Zapolnenie(MyArray); // step1
  Output(MyArray); // step2
  writeln;
  readln;
  Sort_pole(MyArray); // step3
  Output(MyArray); // step4
  writeln;
  readln;
  write('Enter string: ');
  read(s);
  BinarySearch_POLE(MyArray, s); // step 5
  writeln;
  readln;
  readln;
  Output(MyArray); // step6
  writeln;
  readln;
  if NumberOfTrue(MyArray) = 1 then
    writeln(NumberOfTrue(MyArray), ' true element')
  else
    writeln(NumberOfTrue(MyArray), ' true elements');
  writeln;
  readln;
  MakeAllFalse(MyArray); // step7
  Sort_Numbers(MyArray); // step8
  Output(MyArray); // step9
  writeln;
  readln;
  write('Enter value: ');
  read(val);
  BinarySearch_Numbers(MyArray, val); // step10
  writeln;
  readln;
  readln;
  Output(MyArray); // step11
  writeln;
  readln;
  if NumberOfTrue(MyArray) = 1 then
    writeln(NumberOfTrue(MyArray), ' true element')
  else
    writeln(NumberOfTrue(MyArray), ' true elements');
  readln;

end.
