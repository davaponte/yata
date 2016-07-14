unit globals;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

type
  TKind = (I, J, L, O, S, Z, T);

  TShapeTemplate = array[1..4, 1..5, 1..5] of byte;

//Algunos shapes tienen repetición para facilitar el uso de un solo tipo

const
  Shape : array[TKind] of TShapeTemplate = (
//  I_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (1, 1, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (1, 1, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  J_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 0, 0, 0),
      (0, 1, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 1, 1, 1, 0),
      (0, 0, 0, 1, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  L_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 1, 1, 1, 0),
      (0, 1, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 1, 0),
      (0, 1, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  O_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  S_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 1, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 1, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  Z_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 1, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    )
  ),

//  T_Shape_Template : TShapeTemplate =
  (
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 1, 1, 1, 0),
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 1, 1, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0),
      (0, 1, 1, 1, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    ),
    (
      (0, 0, 0, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 1, 1, 0, 0),
      (0, 0, 1, 0, 0),
      (0, 0, 0, 0, 0)
    )
  )
);

implementation

end.
