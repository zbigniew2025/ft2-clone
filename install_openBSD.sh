#!/bin/sh
mkdir -p release/other

echo "Kompilacja plikÃ³w C++ (rtmidi)..."
c++ -O3 -c src/rtmidi/*.cpp -I/usr/local/include -I/usr/local/include/SDL2 -DNDEBUG -DHAS_MIDI

echo "Kompilacja plikÃ³w C (FT2 Core)..."
cc -O3 -c src/*.c src/gfxdata/*.c src/mixer/*.c src/scopes/*.c \
   src/modloaders/*.c src/smploaders/*.c src/libflac/*.c \
   -I/usr/local/include -I/usr/local/include/SDL2 \
   -DNDEBUG -DHAS_LIBFLAC -fcommon

echo "Linkowanie wszystkiego..."
# DODANO: -liconv, aby naprawiÄ bÅÄdy undefined symbol: libiconv_open
c++ *.o -o release/other/ft2-clone \
    -L/usr/local/lib -lSDL2 -liconv -lpthread -lm -lstdc++

# SprzÄtanie Åmieci
rm *.o
echo "Gotowe!"