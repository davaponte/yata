unit figures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Controls, Graphics, globals;

var
  Background : array[1..15, 1..10] of TKind;

const
  StandardBlockSize = 40;
  clOrange = TColor($00a5ff);
  clCyan = clAqua;
  clMagenta = TColor($ff00ff);
  clLightGray = TColor($dfdfdf);
  Colors : array[TKind] of TColor = (clRed, clOrange, clYellow, clCyan, clLime, clNavy, clMagenta);

type
  { TFigure }
  TFigure = class(TComponent)
  private
    Box : array[1..4] of TShape;
    procedure Make_I;
    procedure Make_J;
    procedure Make_L;
    procedure Make_O;
    procedure Make_S;
    procedure Make_T;
    procedure Make_Z;
  public
    constructor Create(Kind : TKind; AParent : TWinControl);
    procedure MoveLeft;
    procedure MoveRight;
    procedure Rotate;
    procedure Down;
    procedure Drop;

  end;

implementation

{ TFigure }

procedure TFigure.Make_I;
begin
  Box[1].Left := 0;
  Box[2].Left := Box[1].Left + Box[1].Width;
  Box[3].Left := Box[2].Left + Box[2].Width;
  Box[4].Left := Box[3].Left + Box[3].Width;
end;

procedure TFigure.Make_J;
begin
  Box[1].Top := 0;
  Box[1].Left := StandardBlockSize;

  Box[2].Top := StandardBlockSize;
  Box[2].Left := StandardBlockSize;

  Box[3].Top := 2 * StandardBlockSize;
  Box[3].Left := StandardBlockSize;

  Box[4].Top := 2 * StandardBlockSize;
  Box[4].Left := 0;
end;

procedure TFigure.Make_L;
begin
  Box[1].Top := 0;
  Box[1].Left := 0;

  Box[2].Top := StandardBlockSize;
  Box[2].Left := 0;

  Box[3].Top := 2 * StandardBlockSize;
  Box[3].Left := 0;

  Box[4].Top := 2 * StandardBlockSize;
  Box[4].Left := StandardBlockSize;
end;

procedure TFigure.Make_O;
begin
  Box[1].Top := 0;
  Box[1].Left := 0;

  Box[2].Top := StandardBlockSize;
  Box[2].Left := 0;

  Box[3].Top := 0;
  Box[3].Left := StandardBlockSize;

  Box[4].Top := StandardBlockSize;
  Box[4].Left := StandardBlockSize;
end;

procedure TFigure.Make_S;
begin
  Box[1].Top := StandardBlockSize;
  Box[1].Left := 0;

  Box[2].Top := StandardBlockSize;
  Box[2].Left := StandardBlockSize;

  Box[3].Top := 0;
  Box[3].Left := StandardBlockSize;

  Box[4].Top := 0;
  Box[4].Left := 2 * StandardBlockSize;
end;

procedure TFigure.Make_T;
begin
  Box[1].Top := 0;
  Box[1].Left := 0;

  Box[2].Top := 0;
  Box[2].Left := StandardBlockSize;

  Box[3].Top := 0;
  Box[3].Left := 2 * StandardBlockSize;

  Box[4].Top := StandardBlockSize;
  Box[4].Left := StandardBlockSize;

end;

procedure TFigure.Make_Z;
begin
  Box[1].Top := 0;
  Box[1].Left := 0;

  Box[2].Top := 0;
  Box[2].Left := StandardBlockSize;

  Box[3].Top := StandardBlockSize;
  Box[3].Left := StandardBlockSize;

  Box[4].Top := StandardBlockSize;
  Box[4].Left := 2 * StandardBlockSize;
end;

constructor TFigure.Create(Kind: TKind; AParent: TWinControl);
var
  c : 1..4;
begin
  For c := Low(Box) to High(Box) do begin
    Box[c] := TShape.Create(Self);
    Box[c].Brush.Color := Colors[Kind];
    Box[c].Pen.Color := clLime;
    Box[c].Top := 0;
    Box[c].Left := 0;
    Box[c].Width := StandardBlockSize;
    Box[c].Height := StandardBlockSize;
  end;
  Case Kind of
    I : Make_I;
    J : Make_J;
    L : Make_L;
    O : Make_O;
    S : Make_S;
    T : Make_T;
    Z : Make_Z;
  end;
  For c := Low(Box) to High(Box) do
    Box[c].Parent := AParent;
end;

procedure TFigure.MoveLeft;
var
  c : 1..4;
begin
  For c := Low(Box) to High(Box) do
    Box[c].Left := Box[c].Left - StandardBlockSize;
end;

procedure TFigure.MoveRight;
var
  c : 1..4;
begin
  For c := Low(Box) to High(Box) do
    Box[c].Left := Box[c].Left + StandardBlockSize;
end;

procedure TFigure.Rotate;
begin
  Box[1].Left := Box[1].Left + StandardBlockSize;
  Box[1].Top := Box[1].Top - StandardBlockSize;

  Box[3].Left := Box[3].Left - StandardBlockSize;
  Box[3].Top := Box[3].Top + StandardBlockSize;

  Box[4].Left := Box[4].Left - 2 * StandardBlockSize;
  Box[4].Top := Box[4].Top + 2 * StandardBlockSize;
end;

procedure TFigure.Down;
var
  c : 1..4;
begin
  For c := Low(Box) to High(Box) do
    Box[c].Top := Box[c].Top + StandardBlockSize;
end;

procedure TFigure.Drop;
begin

end;

initialization
  Randomize;

end.

