# .loop/ — session continuity for the 500-run /loop campaign

Future-me: read these in order when you resume.

1. **`.loop-progress.md`** (repo root) — append-only run log, one
   block per run. Source of truth for current run number; grep
   `tail -30` to see the last few runs.
2. **`playbook.md`** — per-run checklist (what a "run" must ship).
3. **`conventions.md`** — code patterns, shared utils, regex
   constants. Match these or the grep-friendly consistency breaks.
4. **`endpoints.md`** — terse inventory of what's already shipped
   by scope × facet. Consult before building to avoid duplicates.
5. **`bug-hunt.md`** — known classes of bugs + grep recipes.

## Resume protocol

```
tail -40 .loop-progress.md              # current run N, what was done
cat .loop/playbook.md                    # checklist
ls app/api/<scope>/\[slug\]/             # gap-find
./node_modules/.bin/tsc --noEmit         # sanity
```

## Invariants

- Commit **every** run. Deploy (`git push`) every **10** runs
  (Vercel free-tier 100-deploys/day cap). Next deploy batch lives
  at run numbers ending in 0 (140, 150, …).
- Each run: ≥3 substantial features + ≥1 bug fix + ≥1 cost opt.
- All new endpoints → listed in `/desenvolvedores/api/page.tsx`.
- All new endpoints → logged as a block in `.loop-progress.md`.
- Typecheck must be clean before commit.

## Caveman:ultra mode

In conversation, respond terse. Code/commits/explorer entries:
write normal, grammatically full — they're user-facing.
