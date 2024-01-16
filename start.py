import os
import subprocess

# Set environment variable
os.environ["OPENAI_API_KEY"] = "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"




# Start your application
subprocess.call(["autogenstudio", "ui", "--port", "8081"])
