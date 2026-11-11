"""Quarto post-render step: zip the class downloads into docs/downloads/.

- nhanes-bp.zip: the starter project for Analyzing research data with Claude Code.
- nhanes-bp-checkpoint.zip: the same project plus the finished R/01_prepare.R,
  for anyone who falls behind. Both unzip to nhanes-bp/.
- part1-kit-a.zip and part1-kit-b.zip: one Part 1 kit folder plus the kits README.
"""

import shutil
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
project = root / "materials" / "nhanes-bp"
prepare_script = root / "instructor" / "solutions" / "R" / "01_prepare.R"
kits = root / "materials" / "part1-kits"
downloads = root / "docs" / "downloads"
downloads.mkdir(parents=True, exist_ok=True)

# Skip files that should never ship (macOS metadata, R session files).
ignore = shutil.ignore_patterns(".DS_Store", ".Rhistory", ".RData", ".Rproj.user")

# The old Part 2 project zip is gone; remove a stale copy if one is left.
(downloads / "hypertension-cohort.zip").unlink(missing_ok=True)

# Starter project and checkpoint: both unpack to nhanes-bp/.
for zip_name, extra in (("nhanes-bp", None), ("nhanes-bp-checkpoint", prepare_script)):
    with tempfile.TemporaryDirectory() as tmp:
        staging = Path(tmp) / project.name
        shutil.copytree(project, staging, ignore=ignore)
        if extra is not None:
            shutil.copy2(extra, staging / "R" / extra.name)
        shutil.make_archive(
            str(downloads / zip_name),
            "zip",
            root_dir=tmp,
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
