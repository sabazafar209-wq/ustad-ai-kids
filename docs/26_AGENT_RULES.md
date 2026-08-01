# Ustad AI Kids Agent Rules

## Mandatory Reading

Before making changes, review:

01_PRODUCT_REQUIREMENTS.md
02_SYSTEM_ARCHITECTURE.md
07_ROADMAP.md
16_FOLDER_STRUCTURE.md
17_CODING_STANDARDS.md

## Architecture Rules

- Keep Clean Architecture.
- Use Feature First organization.
- Use Riverpod only.
- Use GoRouter only.
- Do not introduce alternative state management.
- Do not rename folders.
- Do not modify unrelated features.

## Development Rules

- Keep flutter analyze at zero errors.
- Prefer extending existing features.
- Keep widgets small and reusable.
- Keep business logic in providers.
- Keep storage access inside repositories.

## Prohibited Actions

- Do not replace Riverpod.
- Do not replace GoRouter.
- Do not change folder structure.
- Do not delete existing files unless explicitly instructed.
- Do not perform large-scale refactors without approval.

## Completion Requirements

Before finishing:

1. Run flutter analyze.
2. Fix all errors.
3. Fix all warnings introduced by the change.
4. Update imports.
5. Keep backward compatibility.