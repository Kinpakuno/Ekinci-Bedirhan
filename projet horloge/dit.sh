# ceci est un script bash
# pour que cela fonctionne, il faut que le paquet
# "libttspico-utils" soit installé
 
pico2wave -l fr-FR -w /tmp/test.wav "$1"
aplay -q /tmp/test.wav
rm /tmp/test.wav

