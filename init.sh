#!/bin/bash

echo ""
echo "[*] ========================================="
echo "[*] VideoRedactor Project Initialization"
echo "[*] ========================================="
echo ""

echo "[+] Creating directory structure..."
mkdir -p src/ui src/core src/settings tests docs examples .github/workflows

echo "[+] Creating files..."

# Create .gitignore
cat > .gitignore << 'EOF'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
# Virtual environments
venv/
ENV/
env/
# IDE
.vscode/
.idea/
# Project specific
projects/
output/
temp/
EOF
echo "[OK] .gitignore"

# Create requirements.txt
cat > requirements.txt << 'EOF'
PyQt5==5.15.9
PyQt5-sip==12.13.0
python-ffmpeg==1.0.16
av==11.0.0
Pillow==10.1.0
pydantic==2.5.3
pydantic-settings==2.1.0
EOF
echo "[OK] requirements.txt"

# Create src/__init__.py
cat > src/__init__.py << 'EOF'
"""VideoRedactor - Professional video pipeline editor"""
__version__ = "1.0.0"
__author__ = "za-no-za"
__license__ = "MIT"
EOF
echo "[OK] src/__init__.py"

# Create src/main.py
cat > src/main.py << 'EOF'
"""Main application entry point"""
from PyQt5.QtWidgets import QApplication
import sys

def main():
    app = QApplication(sys.argv)
    print("VideoRedactor Started")
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()
EOF
echo "[OK] src/main.py"

# Create src/settings/__init__.py
cat > src/settings/__init__.py << 'EOF'
from .config import Config
__all__ = ["Config"]
EOF
echo "[OK] src/settings/__init__.py"

# Create src/core/__init__.py
cat > src/core/__init__.py << 'EOF'
from .project import Project
from .clip import Clip
__all__ = ["Project", "Clip"]
EOF
echo "[OK] src/core/__init__.py"

# Create src/core/clip.py
cat > src/core/clip.py << 'EOF'
from dataclasses import dataclass

@dataclass
class Clip:
    path: str
    start_time: float = 0.0
    audio_track: int = 0
    fade_in_frames: int = 0
    fade_out_frames: int = 0
EOF
echo "[OK] src/core/clip.py"

# Create src/core/project.py
cat > src/core/project.py << 'EOF'
from dataclasses import dataclass, field
from typing import List

@dataclass
class Project:
    clips: List = field(default_factory=list)
    output_width: int = 1920
    output_height: int = 1080
    fps: int = 30
EOF
echo "[OK] src/core/project.py"

# Create src/ui/__init__.py
cat > src/ui/__init__.py << 'EOF'
"""PyQt5 User Interface"""
EOF
echo "[OK] src/ui/__init__.py"

# Create tests/__init__.py
cat > tests/__init__.py << 'EOF'
"""Tests package"""
EOF
echo "[OK] tests/__init__.py"

echo ""
echo "[+] ========================================="
echo "[+] Project initialized successfully!"
echo "[+] Files created: 11"
echo "[+] ========================================="
echo ""
echo "Next steps:"
echo "  1. pip install -r requirements.txt"
echo "  2. python src/main.py"
echo ""
echo "Done!"
