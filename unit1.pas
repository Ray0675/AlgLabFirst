unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  TAGraph, TASeries, TARadialSeries, TATypes;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  A : array[1..25] of integer;
  max, row, col, temp, length, value, cnt, indexMax, index, i : integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
     max := 0;
     Randomize;
     Chart1LineSeries1.Clear();
     for row := 1 to 5 do
     begin
          for col := 1 to 5 do
          begin
               while true do
               begin
                    index := (row - 1) * 5 + col;
                    cnt := 0;
                    length := High(A) - Low(A);
                    temp := random(71) + 50;
                    for value in A do
                    begin
                         if (value = temp) then break;
                         cnt := cnt + 1;
                    end;
                    if (length <= cnt) then
                    begin
                         if (max < temp) then
                         begin
                              indexMax := index;
                              max := temp;
                         end;
                         A[index] := temp;
                         Chart1LineSeries1.AddXY(index, temp);
                         break;
                    end;
               end;
               StringGrid1.Cells[col, row] := IntToStr((A[index]));
          end;
     end;
     Label1.Caption := 'Максимальное число: ' + IntToStr(max);
end;

end.

