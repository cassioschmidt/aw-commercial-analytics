# AW Commercial Performance Pack: dbt project

Governed analytics layer for Adventure Works, feeding the Sigma
Commercial Performance Pack.

## Setup
_TBD_

## Git workflow
- `main` is protected: changes land only through pull requests.
- Branch naming: `feature/<topic>`, `fix/<topic>`, `docs/<topic>`, `chore/<topic>`.
- Commit messages follow Conventional Commits (`feat:`, `fix:`, `docs:`, `test:`, `chore:`).
- Merge strategy: squash merge; branches are deleted after merge.
- Required checks: `sqlfmt` (GitHub Actions) and the dbt CI job.

## Conventions
_TBD: layers, naming, materializations_

## Model-cap budget (Developer plan, 3,000 models/month)
_TBD_

## Test coverage
_TBD: test to business rule mapping_

## Local formatting
```bash
pip install -r requirements-dev.txt
sqlfmt .            # format
sqlfmt --check .    # same check CI runs
```
