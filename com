SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 600;
:sdlSurface1 := TTF_RenderText_Blended(ttfFont,'j1.nom', sdlColor1);

ar
  Text: String;
  Surface: PSDL_Surface;
  Font: PTTF_Font;
  Color: TSDL_Color;
begin
  TTF_Init;
  Font := TTF_OpenFont('path_to_font.ttf', 24);
  if Font = nil then
    Halt;

  Text := 'Score: 10';
  Color.r := 255; Color.g := 255; Color.b := 255; Color.a := 255;

  Surface := TTF_RenderText_Blended(Font, PChar(Text), Color);
  if Surface = nil then
    WriteLn('Erreur : ', TTF_GetError)
  else
    WriteLn('Surface créée avec succès.');

  SDL_FreeSurface(Surface);
  TTF_CloseFont(Font);
  TTF_Quit;
end.
