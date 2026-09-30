"""Quarto post-render step: zip the class downloads into _site/downloads/.

- hypertension-cohort.zip: the Part 2 starter project.
- part1-kit-a.zip and part1-kit-b.zip: one Part 1 kit folder plus the kits README.
"""

import shutil
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
project = root / "materials" / "hypertension-cohort"
kits = root / "materials" / "part1-kits"
downloads = root / "_site" / "downloads"
downloads.mkdir(parents=True, exist_ok=True)

shutil.make_archive(
    str(downloads / "hypertension-cohort"),
    "zip",
    root_dir=project.parent,
    base_dir=project.name,
)

# Each Part 1 kit zip unpacks to part1-kit-a/ (or -b/) containing README.md and kit-a/.
for kit in ("kit-a", "kit-b"):
    name = f"part1-{kit}"
    with tempfile.TemporaryDirectory() as tmp:
        staging = Path(tmp) / name
        staging.mkdir()
        shutil.copy2(kits / "README.md", staging / "README.md")
        shutil.copytree(kits / kit, staging / kit)
        shutil.make_archive(
            str(downloads / name),
            "zip",
            root_dir=tmp,
            base_dir=name,
        )

print(f"Downloads written to {downloads.relative_to(root)}")
