import nemo.collections.asr as nemo_asr

langauge_to_model_path = {
    "bn": "ai4b_indicConformer_bn.nemo",
    "ta": "ai4b_indicConformer_ta.nemo",
    "hi": "ai4b_indicConformer_hi.nemo",
    "mr": "ai4b_indicConformer_mr.nemo"
}

def load_model(device, language):
    model_path = langauge_to_model_path[language]
    print(f"Loading model from: {model_path}")
    model = nemo_asr.models.EncDecCTCModel.restore_from(restore_path=f"model/{model_path}")
    model.eval() # inference mode
    model = model.to(device) # transfer model to device
    return model