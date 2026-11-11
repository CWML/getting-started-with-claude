---
name: check-data
description: Check an NHANES data file against data/data_dictionary.csv. Run it with /check-data <path-to-file>.
disable-model-invocation: true
---

Check $ARGUMENTS against data/data_dictionary.csv.

1. Write an R script in checks/ that reads the file (haven::read_xpt()
   for .xpt files), and run it. Report what the script prints; don't guess.
2. For each dictionary variable whose file column lists this file,
   report the number missing, the codes in its missing_codes column
   (such as 7 and 9), values outside allowed_values, and the minimum
   and maximum.
3. Report any duplicate SEQN values.
4. Print at most 10 rows of data.
5. Never edit or save over the data file. Ask me before fixing anything.
