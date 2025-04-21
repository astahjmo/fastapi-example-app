from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    """Returns a simple OK status."""
    return {"status": "ok"}

# Optional: Add a health check endpoint often used in deployments
@app.get("/health")
async def health_check():
    """Basic health check."""
    return {"status": "healthy"}

# If running directly using uvicorn: uvicorn main:app --host 0.0.0.0 --port 8000
