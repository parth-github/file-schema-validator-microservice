# logger_setup.py
import logging

logger = logging.getLogger("uvicorn.error")  # Use the Uvicorn error logger

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
    handlers=[
        logging.FileHandler("access.log"),       # File output
        logging.StreamHandler()                  # Console output
    ]
)

