FATE_BINKAUDIO += fate-binkaudio-dct
fate-binkaudio-dct: CMD = pcm -i $(SAMPLES)/bink/binkaudio_dct.bik
fate-binkaudio-dct: CMP = oneoff
fate-binkaudio-dct: REF = $(SAMPLES)/bink/binkaudio_dct.pcm
fate-binkaudio-dct: FUZZ = 2

FATE_BINKAUDIO += fate-binkaudio-rdft
fate-binkaudio-rdft: CMD = pcm -i $(SAMPLES)/bink/binkaudio_rdft.bik
fate-binkaudio-rdft: CMP = oneoff
fate-binkaudio-rdft: REF = $(SAMPLES)/bink/binkaudio_rdft.pcm
fate-binkaudio-rdft: FUZZ = 2

FATE_AUDIO += $(FATE_BINKAUDIO)
fate-binkaudio: $(FATE_BINKAUDIO)

FATE_AUDIO += fate-dts
fate-dts: CMD = pcm -i $(SAMPLES)/dts/dts.ts
fate-dts: CMP = oneoff
fate-dts: REF = $(SAMPLES)/dts/dts.pcm

FATE_AUDIO += fate-imc
fate-imc: CMD = pcm -i $(SAMPLES)/imc/imc.avi
fate-imc: CMP = oneoff
fate-imc: REF = $(SAMPLES)/imc/imc.pcm

FATE_AUDIO += fate-nellymoser
fate-nellymoser: CMD = pcm -i $(SAMPLES)/nellymoser/nellymoser.flv
fate-nellymoser: CMP = oneoff
fate-nellymoser: REF = $(SAMPLES)/nellymoser/nellymoser.pcm

FATE_AUDIO += fate-nellymoser-aref-encode
fate-nellymoser-aref-encode: $(AREF)
fate-nellymoser-aref-encode: CMD = enc_dec_pcm flv wav s16le $(REF) -c:a nellymoser
fate-nellymoser-aref-encode: CMP = stddev
fate-nellymoser-aref-encode: REF = ./tests/data/acodec-16000-1.ref.wav
fate-nellymoser-aref-encode: CMP_SHIFT = -1172
fate-nellymoser-aref-encode: CMP_TARGET = 9617
fate-nellymoser-aref-encode: SIZE_TOLERANCE = 268

FATE_AUDIO += fate-ws_snd
fate-ws_snd: CMD = md5 -i $(SAMPLES)/vqa/ws_snd.vqa -f s16le

FATE_TESTS += $(FATE_AUDIO)
fate-audio: $(FATE_AUDIO)
