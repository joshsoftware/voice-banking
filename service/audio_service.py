import os
import tempfile
import openai
from dotenv import load_dotenv
import torch
import torchaudio
import logging
import nemo.collections.asr as nemo_asr

logging.basicConfig(level=logging.INFO)  # Set the logging level
logger = logging.getLogger(__name__)

logger.info("Loading model...")
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model = nemo_asr.models.EncDecCTCModel.restore_from(restore_path="model/ai4b_indicConformer_bn.nemo")
model.eval() # inference mode
model = model.to(device) # transfer model to device

def load_and_resample_audio(file_path, target_sampling_rate=16000):
    # Load the audio file using torchaudio
    waveform, original_sampling_rate = torchaudio.load(file_path)
    
    # Check if resampling is needed
    if original_sampling_rate != target_sampling_rate:
        resampler = torchaudio.transforms.Resample(orig_freq=original_sampling_rate, new_freq=target_sampling_rate)
        waveform = resampler(waveform)
    
    # Convert waveform to a 1D numpy array for compatibility with the processor
    return waveform.squeeze(0).numpy()

def transcribe_with_indic(audio_path, language):
    logger.info("transcription started")
    
    model.cur_decoder = "ctc"    
    file_path = ""
    
    if isinstance(audio_path, str):
        # If input is a file path, use it directly
        file_path = audio_path
    else:
        # Handle file-like object: Save it to a temporary file
        with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_file:
            temp_file.write(audio_path.read())
            temp_file_path = temp_file.name
            file_path = temp_file_path

    try:
        audio_input = load_and_resample_audio(file_path)
        audio_input = audio_input.unsqueeze(0).to(device)
        
        transcription = model.transcribe([audio_input], batch_size=1,logprobs=False, language_id=language)[0]
    finally:
        # Clean up the temporary file
        if not isinstance(audio_path, str):
            os.remove(temp_file_path)
    
    logger.info("transcription done")
    return transcription
