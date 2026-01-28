@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
color 0A

echo.
echo [*] =========================================
echo [*] VideoRedactor Project Initialization
echo [*] =========================================
echo.

REM Create directories
echo [+] Creating directory structure...
if not exist "src" mkdir src
if not exist "src\ui" mkdir src\ui
if not exist "src\core" mkdir src\core
if not exist "src\settings" mkdir src\settings
if not exist "tests" mkdir tests
if not exist "docs" mkdir docs
if not exist "examples" mkdir examples
if not exist ".github\workflows" mkdir .github\workflows

echo [+] Creating files...

REM Create .gitignore
(
echo # Byte-compiled / optimized / DLL files
echo __pycache__/
echo *.py[cod]
echo *$py.class
echo # Virtual environments
echo venv/
echo ENV/
echo env/
echo # IDE
echo .vscode/
echo .idea/
echo # Project specific
echo projects/
echo output/
echo temp/
) > .gitignore
echo [OK] .gitignore

REM Create requirements.txt
(
echo PyQt5==5.15.9
echo PyQt5-sip==12.13.0
echo python-ffmpeg==1.0.16
echo av==11.0.0
echo Pillow==10.1.0
echo pydantic==2.5.3
echo pydantic-settings==2.1.0
) > requirements.txt
echo [OK] requirements.txt

REM Create src/__init__.py
(
echo """VideoRedactor - Professional video pipeline editor"""
echo __version__ = "1.0.0"
echo __author__ = "za-no-za"
echo __license__ = "MIT"
) > src\__init__.py
echo [OK] src/__init__.py

REM Create src/main.py
(
echo """Main application entry point"""
echo from PyQt5.QtWidgets import QApplication
echo import sys
echo.
echo def main():
echo     app = QApplication(sys.argv^)
echo     print("VideoRedactor Started"^)
echo     sys.exit(app.exec_()^)
echo.
echo if __name__ == "__main__":
echo     main()
) > src\main.py
echo [OK] src/main.py

REM Create src/settings/__init__.py
(
echo from .config import Config
echo __all__ = ["Config"]
) > src\settings\__init__.py
echo [OK] src/settings/__init__.py

REM Create src/core/__init__.py
(
echo from .project import Project
echo from .clip import Clip
echo __all__ = ["Project", "Clip"]
) > src\core\__init__.py
echo [OK] src/core/__init__.py

REM Create src/core/clip.py
(
echo from dataclasses import dataclass
echo.
echo @dataclass
echo class Clip:
echo     path: str
echo     start_time: float = 0.0
echo     audio_track: int = 0
echo     fade_in_frames: int = 0
echo     fade_out_frames: int = 0
) > src\core\clip.py
echo [OK] src/core/clip.py

REM Create src/core/project.py
(
echo from dataclasses import dataclass, field
echo from typing import List
echo.
echo @dataclass
echo class Project:
echo     clips: List = field(default_factory=list^)
echo     output_width: int = 1920
echo     output_height: int = 1080
echo     fps: int = 30
) > src\core\project.py
echo [OK] src/core/project.py

REM Create src/ui/__init__.py
(
echo """PyQt5 User Interface"""
) > src\ui\__init__.py
echo [OK] src/ui/__init__.py

REM Create tests/__init__.py
(
echo """Tests package"""
) > tests\__init__.py
echo [OK] tests/__init__.py

echo.
echo [+] =========================================
echo [+] Project initialized successfully!
echo [+] Files created: 11
echo [+] =========================================
echo.
echo Next steps:
echo   1. pip install -r requirements.txt
echo   2. python src/main.py
echo.
pause
