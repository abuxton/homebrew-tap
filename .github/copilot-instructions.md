# GitHub Copilot Instructions for Homebrew Tap

This file contains instructions for GitHub Copilot when working on the `abuxton/tap` Homebrew repository.
Refer to the `AGENTS.md` file for guidance on how agents can assist with repository maintenance and formula management. Any content in this file is in addition to that material and should be focused on providing specific coding guidance to Copilot when generating code for this repository.


## Repository Purpose

This is a custom Homebrew tap (`abuxton/tap`) for distributing software formulas via Homebrew. Formulas are Ruby files that define how to install software packages.

## Key Guidelines

### Code Style & Standards

1. **Ruby Format**
   - Use frozen string literals: `# frozen_string_literal: true` at the top of files
   - 2-space indentation (Ruby standard)
   - Follow Homebrew formula conventions
   - Refer to `.rubocop.yml` for style rules

2. **Markdown Format**
   - Follow rules in `.mdlrc` for markdown linting
   - Keep lines under 120 characters when practical
   - Use consistent heading hierarchy

3. **Shell Scripts**
   - Use bash/zsh syntax
   - Follow shellcheck rules
   - Add `.sh` extension to executable scripts

### Formula Development

1. **File Placement**
   - All formulas go in `Formula/` directory
   - Naming: `Formula/<package-name>.rb`

2. **Required Formula Components**

```ruby
class <PackageName> < Formula
  desc 'Short description'
  homepage 'https://...'
  version '1.0.0'

  # Platform-specific URLs
  if OS.mac?
    url '...'
  end

  def install
    # Installation logic
  end

  test do
    # Test logic
  end
end
```

3. **Platform Support**
   - Support macOS Intel and ARM when possible
   - Include Linux support if applicable
   - Use conditional blocks instead of multiple files

4. **SHA256 Checksums**
   - Include sha256 for binary downloads
   - Update when version changes
   - Verify checksums for security

### Configuration Files

- **`.pre-commit-config.yaml`**: Pre-commit hook definitions - update when adding new validation tools
- **`.rubocop.yml`**: Ruby style rules - follow for all Ruby code
- **`.rubocop_todo.yml`**: Temporary RuboCop exceptions - remove as code improves
- **`.mdlrc`**: Markdown lint rules - enforce consistent markdown style

### Workflow Files

GitHub Actions workflows handle automated checks:

- **`pre-commit.yml`**: Runs all pre-commit hooks on PRs and pushes to `main`
- **`brew-audit.yml`**: Validates Homebrew formula syntax
- **`code-quality.yml`**: Runs RuboCop, Reek, and Fasterer analysis

All workflows target the `main` branch. Update trigger branches if repository configuration changes.

### Pre-commit Hooks

Before committing changes, ensure all pre-commit hooks pass:

```bash
pre-commit run --all-files
```

Hooks validate:

- Ruby speed improvements (fasterer)
- Markdown formatting (markdownlint)
- Shell script quality (shellcheck)
- Ruby style (rubocop)
- Git integrity (git-check, git-dirty)
- Code smells (reek)

### Testing Formulas

1. **Local Testing**

```bash
brew audit --strict Formula/<name>.rb
ruby -c Formula/<name>.rb
```

2. **GitHub Testing**
   - Automated tests run on all PRs
   - Check GitHub Actions for failures
   - Fix issues before merging

### Commit Messages

Use clear, descriptive commit messages:

- Add formula: "Add <name> formula v<version>"
- Update formula: "Update <name> to v<version>"
- Remove formula: "Remove <name> formula and all references"
- Configuration: "Update <what> configuration"
- Workflows: "Fix <workflow> workflow for <reason>"

### Documentation

- Update `README.md` when adding or removing formulas
- Keep installation instructions current
- Document any special requirements or limitations
- Refer to `AGENTS.md` for automation guidance

### Common Tasks

1. **Adding a New Formula**
   - Create `Formula/<name>.rb` with proper structure
   - Test with `brew audit --strict`
   - Run `pre-commit run --all-files`
   - Update `README.md` if needed
   - Commit and push

2. **Updating an Existing Formula**
   - Update version and URLs
   - Recalculate SHA256 checksums
   - Test thoroughly
   - Pass all pre-commit hooks
   - Commit with appropriate message

3. **Removing a Formula**
   - Delete the formula file
   - Remove `.rubocop_todo.yml` exceptions
   - Update `README.md` documentation
   - Commit with "Remove ... and all references"

### Branch Conventions

- `main`: Default branch, production-ready code
- `hotfix/*`: Quick fixes for production issues
- `feature/*`: New features or formulas

All work targets the `main` branch for CI/CD workflows.

### Troubleshooting

1. **Pre-commit fails**: Run `pre-commit run --all-files` locally to see issues
2. **RuboCop violations**: Check `.rubocop.yml` or add exceptions to `.rubocop_todo.yml`
3. **MacOS-specific issues**: Test on both Intel and ARM when possible
4. **Workflow failures**: Check GitHub Actions logs for specific error details

## Resources

- <https://docs.brew.sh/Formula-Cookbook>
- <https://rubystyle.guide/>
- <https://pre-commit.com/>
- <https://docs.github.com/en/actions>

---

**Last Updated**: February 22, 2026
