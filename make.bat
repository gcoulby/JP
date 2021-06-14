cls
set mypath=%cd%
if not exist %mypath%\build\ mkdir %mypath%\build

@REM P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\main.o %mypath%\main.c
@REM P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o %mypath%\build\main.gb %mypath%\build\main.o



@REM mod2gbt walking.mod song -c 2

P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\main.o %mypath%\main.c
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\output.o %mypath%\output.c
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\gbt_player.o %mypath%\gbt_player.s
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\gbt_player_bank1.o %mypath%\gbt_player_bank1.s

P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -Wl-yt1 -Wl-yo4 -Wl-ya0 -o %mypath%\build\main.gb %mypath%\build\main.o %mypath%\build\output.o %mypath%\build\gbt_player.o %mypath%\build\gbt_player_bank1.o

del *.o *.lst



if exist %mypath%\build\main.gb P:\_lib\bgbw64\bgb64.exe %mypath%\build\main.gb