 
unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ExtCtrls, ActnList, globals, figures, sdl, sdl_mixer;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionDrop : TAction;
    ActionDown : TAction;
    ActionRotate : TAction;
    ActionMoveLeft : TAction;
    ActionMoveRight : TAction;
    ActionList : TActionList;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10 : TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem8 : TMenuItem;
    MenuItem9 : TMenuItem;
    ScrollBox: TScrollBox;
    StatusBar: TStatusBar;
    procedure ActionDownExecute(Sender : TObject);
    procedure ActionMoveLeftExecute(Sender : TObject);
    procedure ActionMoveRightExecute(Sender : TObject);
    procedure ActionRotateExecute(Sender : TObject);
    procedure FormClose(Sender : TObject; var CloseAction : TCloseAction);
    procedure FormCreate(Sender : TObject);
    procedure MenuItem10Click(Sender : TObject);
    procedure MenuItem4Click(Sender : TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender : TObject);
  private
    Tetromino : TFigure;
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.MenuItem6Click(Sender: TObject);
var
  Fig : TFigure;
  d   : byte;
  c   : TKind;
begin
  For d := 1 to 3 do
    For c := Low(TKind) to High(TKind) do begin
      Fig := TFigure.Create(c, ScrollBox);
      Application.ProcessMessages;
      Sleep(500);
      Fig.Free;
    end;
end;

procedure TMainForm.MenuItem4Click(Sender : TObject);
begin
  Close;
end;

procedure TMainForm.MenuItem10Click(Sender : TObject);
begin
  Tetromino := TFigure.Create(I, ScrollBox);
  ScrollBox.Canvas.Brush.Color := clRed;
  ScrollBox.Canvas.Pen.Color := clWhite;
  ScrollBox.Canvas.Rectangle(40, 40, 80, 80);

//  Tetromino.Free;
end;

procedure TMainForm.ActionMoveRightExecute(Sender : TObject);
begin
  Tetromino.MoveRight;
end;

procedure TMainForm.ActionRotateExecute(Sender : TObject);
begin
  Tetromino.Rotate;
end;

procedure TMainForm.FormClose(Sender : TObject; var CloseAction : TCloseAction);
begin
  SDL_QuitSubSystem(SDL_INIT_AUDIO);
  SDL_Quit;
end;

procedure TMainForm.FormCreate(Sender : TObject);
var
  Wave : PMix_Chunk;
  audio_rate: integer;
  audio_format: Uint16;
  audio_channels: integer;
  audio_buffers : integer;
  loops: integer;

  k : integer;
  St : string;
begin
  If ((SDL_InitSubSystem(SDL_INIT_AUDIO) < 0)) then begin
    Application.MessageBox( 'Could not initialize SDL Audio','ERROR', 0);
    SDL_Quit;
    Exit;
  end else begin
{    audio_rate := StrToInt(seAudioRate.Text);
    audio_format := StrToInt(seAudioFormat.Text);
    audio_channels := StrToInt(seAudioChannels.Text);
    audio_buffers := StrToInt(seAudioBuffers.Text);
    // Open the audio device
    if ( Mix_OpenAudio( audio_rate, audio_format, audio_channels, audio_buffers ) < 0) then begin
      Memo.Lines.Add(Format('Could not open audio: %s', [SDL_GetError]));
      Exit;
    end else begin
      Mix_QuerySpec( audio_rate, audio_format, audio_channels);
      If (audio_channels > 1) then
        Memo.Lines.Add(Format('Opened audio at %d Hz %d bit %s', [audio_rate,
          (audio_format and $FF), 'stereo']))
      else
        Memo.Lines.Add(Format('Opened audio at %d Hz %d bit %s', [audio_rate,
          (audio_format and $FF), 'mono']));

      if (cbLoops.Checked) then
      begin
        Memo.Lines.Add('( looping )');
        loops := -1;
      end
      else
        Memo.Lines.Add('( not looping ) ');

      bAudioOpen := true;

      // Load the requested wave file * /
      wave := Mix_LoadWAV(PChar(Edit1.Text));
      if (wave = nil) then
      begin
        Memo.Lines.Add(Format('Could not load %s: %s', [Edit1.Text, SDL_GetError()]));
        exit;
      end;

      // Play and then exit * /
      Mix_PlayChannel(0, wave, loops);
      while ( Mix_Playing(0) = 0 ) do
        SDL_Delay(100);
    end;
}
  end;

  audio_rate := 44100;
  audio_format := 8;
  audio_channels := 1;
  audio_buffers := 100;


  If (Mix_OpenAudio(audio_rate, audio_format, audio_channels, audio_buffers) < 0) then begin
    St := Format('Could not open audio: %s', [SDL_GetError]);
    St := 'ERROR: ' + St;
    Exit;
  end;

  Mix_QuerySpec( audio_rate, audio_format, audio_channels);
  If (audio_channels > 1) then
     St := Format('Opened audio at %d Hz %d bit %s', [audio_rate,
       (audio_format and $FF), 'stereo'])
  else
     St := Format('Opened audio at %d Hz %d bit %s', [audio_rate,
       (audio_format and $FF), 'mono']);


//  Wave := Mix_LoadWAV('/home/data/Projects/Lazarus/yata/sounds/Beat.wav');
  Wave := Mix_LoadWAV('/home/data/Projects/Lazarus/yata/tetrisb2.wav');

  If (Wave = Nil) then begin
    St := Format('Could not load: %s', [SDL_GetError()]);
    St := 'ERROR: ' + St;
  end;

  k := Mix_PlayChannel(0, Wave, -1);
  While ( Mix_Playing(0) = 0 ) do
    SDL_Delay(100);

  k := Round(Sin(k));
  Write(k);
end;

procedure TMainForm.ActionMoveLeftExecute(Sender : TObject);
begin
  Tetromino.MoveLeft;
end;

procedure TMainForm.ActionDownExecute(Sender : TObject);
begin
  Tetromino.Down;
end;

procedure TMainForm.MenuItem7Click(Sender : TObject);
var
 Fig : TShape;
 Row : 1..15;
 Col : 1..10;
begin
  For Row := Low(Background) to High(Background) do
    For Col := Low(Background[1]) to High(Background[1]) do begin
      Fig := TShape.Create(Self);
      Fig.Brush.Color := Random($FFFFFF);
      Fig.Pen.Color := clLime;
      Fig.Top := StandardBlockSize * (Row - 1);
      Fig.Left := StandardBlockSize * (Col - 1);
      Fig.Width := StandardBlockSize;
      Fig.Height := StandardBlockSize;
      Fig.Parent := ScrollBox;
    end;

end;

end.

