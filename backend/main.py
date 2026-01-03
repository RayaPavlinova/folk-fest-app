from fastapi import FastAPI

app = FastAPI(
    title="Folk Fest API",
    description="Backend API for folk costume festivals",
    version="0.1.0"
)

@app.get("/")
def root():
    return {"message": "Backend is running"}
