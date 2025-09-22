from fastapi import FastAPI, UploadFile, File, Form
from faster_whisper import WhisperModel
from rapidfuzz import fuzz
import uvicorn, io, langid, re
import banking_api
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # allow all for testing
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(banking_api.router)

@app.get("/")
async def root():
    return {"message": "STT Service Running"}

# Load model (use 'medium' for faster local PoC, 'large-v3' for accuracy)
#model = WhisperModel("medium", compute_type="int8_float16")
model = WhisperModel("medium", compute_type="int8")

INTENTS = [
    {"name": "get_balance", "keys": ["balance", "बैलेंस", "பாலன்ஸ்"]},
    {"name": "pay_person", "keys": ["pay", "send", "भेज", "पेमेंट", "UPI"]},
    {"name": "search_txn", "keys": ["search", "transactions", "खर्च", "व्यय"]},
    {"name": "recent_txn", "keys": ["recent", "last", "आखिरी", "पिछले"]},
]

@app.post("/voice/transcribe-intent")
async def transcribe_intent(audio: UploadFile = File(...), session_id: str = Form(...)):
    wav = await audio.read()
    segments, info = model.transcribe(io.BytesIO(wav), language=None, beam_size=5)
    #lang = model.detect_language(wav,)
    text = " ".join([s.text for s in segments])
    print(langid.classify(text)[0])
    lang = info.language or langid.classify(text)[0]
    print(lang)

    # Extract amount
    amt = None
    m_amt = re.search(r"(?:rs|₹|rupees|रुपया|रुपये)\\s*([0-9]+)", text, re.I)
    if m_amt: amt = int(m_amt.group(1))

    # Match intent
    best = (None, -1)
    for intent in INTENTS:
        print(text)
        score = max([fuzz.partial_ratio(k, text) for k in intent["keys"]])
        if score > best[1]:
            best = (intent["name"], score)

    intent = {"name": best[0] or "unknown", "entities": {"amount": amt}}
    print(intent)
    return {"transcript": text.strip(), "lang": lang, "intent": intent}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)