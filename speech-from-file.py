import os
from pocketsphinx import AudioFile, get_model_path

model_path = get_model_path()

config = {
    'verbose': False,
    'audio_file': "/var/www/speech-to-text-wit-ai/test/record.wav",
    'buffer_size': 2048,
    'no_search': False,
    'full_utt': False,
    'hmm': os.path.join(model_path, 'es-es'),
    'lm': os.path.join(model_path, 'es-20k.lm.bin'),
    'dict':os.path.join(model_path, 'es.dict')
}

audio = AudioFile(**config)
for phrase in audio:
    print(phrase)
