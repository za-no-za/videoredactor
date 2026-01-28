#!/usr/bin/env python3
"""
Automated Project Setup Script for VideoRedactor
Creates all necessary project files and directory structure.
Usage: python setup.py
"""

import os
from pathlib import Path

class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    RED = '\033[91m'
    RESET = '\033[0m'

def log_info(msg):
    print(f"{Colors.BLUE}[INFO]{Colors.RESET} {msg}")

def log_success(msg):
    print(f"{Colors.GREEN}[SUCCESS]{Colors.RESET} {msg}")

def log_error(msg):
    print(f"{Colors.RED}[ERROR]{Colors.RESET} {msg}")

FILES = {
    'README.md': '''# VideoRedactor 🎬\n\nПрофессиональное приложение для создания видео-пайплайнов с поддержкой многопоточного рендера через FFmpeg.\n\n## ✨ Возможности\n\n- 📋 Пайплайны видео\n- ✂️ Редактирование\n- 🎬 Кроссфейды\n- ⚙️ Гибкие параметры\n- 💾 Сохранение проектов\n- 🔄 Многопоточный рендер''',
    
    'src/__init__.py': '''"""VideoRedactor - Professional video pipeline editor"""\n__version__ = "1.0.0"\n__author__ = "za-no-za"\n__license__ = "MIT"''',
    
    'src/main.py': '''"""Main application entry point"""\nfrom PyQt5.QtWidgets import QApplication\nimport sys\n\ndef main():\n    app = QApplication(sys.argv)\n    print("VideoRedactor Started")\n    sys.exit(app.exec_())\n\nif __name__ == "__main__":\n    main()''',
    
    'src/settings/__init__.py': '''from .config import Config, get_config\n__all__ = ["Config", "get_config"]''',
    
    'src/settings/config.py': '''from dataclasses import dataclass\nfrom typing import Optional\n\n@dataclass\nclass VideoSettings:\n    width: int = 1920\n    height: int = 1080\n    fps: int = 30\n\nclass Config:\n    def __init__(self):\n        self.video = VideoSettings()''',
    
    'src/core/__init__.py': '''from .project import Project\nfrom .clip import Clip\n__all__ = ["Project", "Clip"]''',
    
    'src/core/clip.py': '''from dataclasses import dataclass\n\n@dataclass\nclass Clip:\n    path: str\n    start_time: float = 0.0\n    audio_track: int = 0''',
    
    'src/core/project.py': '''from dataclasses import dataclass, field\nfrom typing import List\nfrom .clip import Clip\n\n@dataclass\nclass Project:\n    clips: List[Clip] = field(default_factory=list)\n    output_width: int = 1920\n    output_height: int = 1080''',
    
    'src/ui/__init__.py': '''"""PyQt5 User Interface"""''',
    
    'tests/__init__.py': '''"""Tests package"""''',
    
    'setup.cfg': '''[metadata]\nname = videoredactor\nversion = 1.0.0\n''',
}

def create_files():
    """Create all project files"""
    log_info("Creating project structure...")
    
    created = 0
    for filepath, content in FILES.items():
        path = Path(filepath)
        path.parent.mkdir(parents=True, exist_ok=True)
        
        if path.exists():
            log_info(f"Skipping {filepath} (already exists)")
            continue
        
        try:
            path.write_text(content, encoding='utf-8')
            log_success(f"Created {filepath}")
            created += 1
        except Exception as e:
            log_error(f"Failed to create {filepath}: {e}")
    
    log_info(f"\nTotal files created: {created}")
    log_success("Project setup completed!")

if __name__ == "__main__":
    create_files()
