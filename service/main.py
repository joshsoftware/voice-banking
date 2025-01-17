from fastapi import FastAPI, BackgroundTasks, UploadFile
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from action_extrator import extract_action_from_transcription
from audio_service import transcribe_with_indic
from starlette.middleware.cors import CORSMiddleware

app = FastAPI()

# Add CORS middleware to the application
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all HTTP methods
    allow_headers=["*"],  # Allows all headers
)

@app.get("/")
def root_route():
    return 'Hello, this is the root route for voice banking server'

class Body(BaseModel):
    audio_file_link: str
    language: str

@app.post("/get-action-from-audio")
async def get_action_from_transcription(file: UploadFile):
    try:
        # Transcribe
        # transcription = transcribe_audio(audio=file.file, translate=True)
        
        translation = transcribe_with_indic(file.file, 'bn')
        print(f"Transcript (IndicConformer): {translation}")
        
        # Get action
        # action = extract_action_from_transcription(transcription["full_transcript"])
        action = extract_action_from_transcription(translation)
        
        # Return response
        return JSONResponse(content={"result": action}, status_code=200)
    
    except Exception as e:
        print(f"error: {e}")
        return JSONResponse(content={"result": str(e)}, status_code=500)
