# data/raw/: the original CDC files

**Never edit, move, rename or overwrite these files.** Scripts read them. Everything you make goes in `output/`.

These are public-use files from the National Health and Nutrition Examination Survey (NHANES), August 2021–August 2023. They are exactly as CDC publishes them. They are SAS transport files (`.xpt`); read them in R with `haven::read_xpt()`.

| File | What it holds | Rows | Source URL |
|---|---|---|---|
| `DEMO_L.xpt` | Demographics, exam status, survey weights and design variables | 11,933 | <https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/DEMO_L.xpt> |
| `BPXO_L.xpt` | Blood pressure, three oscillometric readings | 7,801 | <https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/BPXO_L.xpt> |
| `BPQ_L.xpt` | Blood pressure questionnaire (diagnosis, medication) | 8,501 | <https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/BPQ_L.xpt> |

Downloaded: 2026-11-10. The CDC codebooks for these files are in `docs/codebooks/` (same URLs, ending in `.htm`).

## Check that the files are unchanged

Each file's SHA-256 checksum at download:

```text
ca4374a158b493b8b0163e1388da21d57a18d1b9cecff2aa4e2fa2bec494fe23  DEMO_L.xpt
189aa9bed689d2c69cf8d780b01de85073276fea5694dd52cdf696229f9054a6  BPXO_L.xpt
0acde3af0526c375942fe0735e3bf69a0422bcbc606f98a478209d2f47baa4b5  BPQ_L.xpt
```

To check them, run this in a terminal from this folder (macOS or Linux):

```text
shasum -a 256 DEMO_L.xpt BPXO_L.xpt BPQ_L.xpt
```

On Windows PowerShell, use `Get-FileHash DEMO_L.xpt` (SHA-256 is the default). Or in R: `digest::digest("data/raw/DEMO_L.xpt", algo = "sha256", file = TRUE)` (needs the digest package).

Source: CDC/NCHS. These files are in the public domain. The NCHS data user agreement still applies (see the project `README.md`).
