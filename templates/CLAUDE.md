# <Project name>

## Commands
- Build: <command>
- Test: <command> (must be green before reporting any task complete)
- Lint: <command>

## Conventions
- <language/framework version, key style rules>
- <the one or two conventions that get violated most often>

## Architecture
- <two or three lines on where things live>

## Verifying your work

- Build: <command> (must finish with a success message)
- Test: <command> (all green; never skip or delete a failing test)
- Lint: <command> (zero warnings)

Run all three before reporting any task complete, and show the output. If a test fails, fix the code, not the test. For bug fixes, write the failing test first, confirm it fails for the expected reason, commit it, then make it pass without editing the test.

## Things Claude gets wrong here
- <add an entry the second time the same mistake happens — that's the rule>

## Intents and specs
- `intent.md` files live in `intents/`. Requirements/design specs (`spec.md`) and implementation plans (`plan.md`) sit alongside the intent they came from.
