import re
import os

def extract_jpegs_from_multipart(data, boundary=b'--BoundaryString'):
    frames = []
    # Ensure boundary starts with b'--'
    if not boundary.startswith(b'--'):
        boundary = b'--' + boundary

    parts = data.split(boundary)
    for part in parts:
        if b'Content-type: image/jpeg' in part:
            header_end = part.find(b'\r\n\r\n')
            if header_end == -1:
                continue
            jpeg_data = part[header_end+4:]
            start = jpeg_data.find(b'\xff\xd8')
            end = jpeg_data.find(b'\xff\xd9')
            if start != -1 and end != -1:
                frames.append(jpeg_data[start:end+2])
    return frames

# === LOAD RAW TCP STREAM ===
with open("tcp_stream_dump.txt", "rb") as f:
    raw_data = f.read()

# === RUN EXTRACTOR ===
frames = extract_jpegs_from_multipart(raw_data)

# === SAVE ===
os.makedirs("extracted_frames", exist_ok=True)
for i, frame in enumerate(frames):
    path = f"extracted_frames/frame_{i:04}.jpg"
    with open(path, "wb") as f:
        f.write(frame)
    print(f"[+] Saved: {path}")

print(f"\n✅ Done: Extracted {len(frames)} JPEGs.")
