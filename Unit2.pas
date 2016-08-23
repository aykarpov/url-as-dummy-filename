unit Unit2;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface
uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

function ZamenaURL( stroka :string ): string;
function ZamenaSimvola1( simvol :Char ): char;
function ZamenaSimvola2( simvol :char ): string;
procedure UdalenieHTTP( var stroka:string; var novaaq_stroka: string );
function OpredelenieSposobaZameny( stroka :string ):integer ;

implementation

procedure UdalenieHTTP( var stroka:string; var novaaq_stroka: string );
var
   poziciaq :Integer;
begin
   poziciaq := Pos( 'http://', stroka );
   if poziciaq > 0
     then
       begin
         if poziciaq > 1
           then
             begin
               novaaq_stroka := 'ОСТОРОЖНО!!! - ';
             end
           else
             begin
               Delete( stroka, 1, 7 );
             end;
       end;



end;

function ZamenaURL( stroka :string ): string;
var
  novaaq_stroka,
  simvol2
                :string;
  dlina_stroki,
  i,
  VariantZameny
                :Integer;
  simvol1       :Char;
begin
   //заглушка Result := stroka + ' сработало!';
   novaaq_stroka := '';
   UdalenieHTTP( stroka, novaaq_stroka );
   VariantZameny := OpredelenieSposobaZameny( stroka );
   dlina_stroki := Length( stroka );
   if VariantZameny = 1
     then
       begin
         //ShowMessage( 'первый способ замены' );
         for i := 1 to dlina_stroki do
           begin
             simvol1 := stroka[ i ];
             simvol2 := ZamenaSimvola1( simvol1 );
             novaaq_stroka := novaaq_stroka + simvol2;
           end;
       end
     else
       begin
         //ShowMessage( 'второй способ замены' );
         for i := 1 to dlina_stroki do
           begin
             simvol1 := stroka[ i ];
             simvol2 := ZamenaSimvola2( simvol1 );
             novaaq_stroka := novaaq_stroka + simvol2;
           end;
       end;
   Result := novaaq_stroka;


end;

function OpredelenieSposobaZameny( stroka :string ):integer ;
var
  zapretnye_znaki: array [1..6] of Char;
  dlina_stroki,
  i, j,
  maks_znak
                 :Integer;
  simvol         :Char;
begin
  maks_znak := 1;
  zapretnye_znaki[1] := '.';
  zapretnye_znaki[2] := '/';
  zapretnye_znaki[3] := '?';
  zapretnye_znaki[4] := '\';
  zapretnye_znaki[5] := '*';
  zapretnye_znaki[6] := ':';
  dlina_stroki := Length( stroka );
  for i := 1 to dlina_stroki do
    begin
      simvol := stroka[ i ];
      for j := 1 to 5 do
        begin
          if simvol = zapretnye_znaki[ j ]
            then
              begin
                if j > maks_znak
                  then
                    begin
                      maks_znak := j;
                    end;
              end;
        end;


    end;
  if maks_znak > 2
    then Result := 2
    else Result := 1;
end;

function ZamenaSimvola1( simvol :Char ): char;
begin
  //Result := simvol;
  //Result := '+';
  case simvol of
    '.': simvol := '+';
    '/': simvol := '=';
  end;
  Result := simvol;
end;

function ZamenaSimvola2( simvol :char ): string;
var
  zamena :string;
begin
  //Result := simvol;
  //Result := '+';
  zamena := simvol;
  case simvol of
    '.': zamena := '(tocqka)';
    '/': zamena := '(naklon)';
    '?': zamena := '(vopros)';
    ':': zamena := '(dvoetocqie)';
  end;
  Result := zamena;
end;

end.
