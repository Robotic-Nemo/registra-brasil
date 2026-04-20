# .loop/ — resume protocol

```
tail -20 .loop-progress.md      # current run N
cat .loop/state.txt             # deploy cadence
bash .loop/gen-manifest.sh      # refresh route list
cat .loop/playbook.txt          # per-run checklist
```

Files:
- `state.txt` — run/deploy counters (one line).
- `manifest.txt` — flat `app/**/route.ts` paths. Grep-before-glob.
- `playbook.txt` — 9-step per-run sequence.
- `conventions.tsv` — key/value rules (runtime, regex, Cache-Control tiers, shared utils).
- `bugs.tsv` — pattern / grep / fix.
- `endpoints.tsv` — scope × facet × has.
- `ideas.txt` — shelf of future endpoints.
- `archive-001-130.md` — cold archive of old run blocks; do not re-read.

Invariants: commit every run; deploy every 10; each run ≥3 features + ≥1 bug fix + ≥1 cost opt; explorer updated; tsc clean.
