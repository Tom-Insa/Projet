SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 600;
:sdlSurface1 := TTF_RenderText_Blended(ttfFont,'j1.nom', sdlColor1);
