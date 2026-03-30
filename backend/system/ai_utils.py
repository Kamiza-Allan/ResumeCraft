import os
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def generate_resume_suggestions(current_content):
    """
    Takes the current resume JSON and asks the AI for improvements.
    """
    prompt = f"Improve the following resume content for ATS optimization and professional impact: {current_content}"
    
    response = client.chat.completions.create(
        model="gpt-3.5-turbo", # or gpt-4o
        messages=[
            {"role": "system", "content": "You are an expert resume writer and career coach."},
            {"role": "user", "content": prompt}
        ]
    )
    
    return response.choices[0].message.content