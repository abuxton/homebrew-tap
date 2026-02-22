# Agents Guide for Homebrew Tap Management

This document outlines how to use AI agents and automation for managing the `abuxton/tap` Homebrew repository.

## Overview

The `abuxton/tap` repository is a custom Homebrew tap for distributing software formulas. Agents can help with:

- Formula creation and updates
- Dependency management
- Testing and validation
- Release automation

## Formula Management

### Creating a New Formula

An agent should follow these steps when creating a new formula:

1. Understand the software requirements
   - Get the software's homepage URL
   - Identify supported platforms (macOS Intel/ARM, Linux)
   - Determine available binary releases

2. Create the formula file
   - Place in `Formula/<name>.rb`
   - Follow Homebrew formula conventions
   - Use frozen string literals: `# frozen_string_literal: true`
   - Include proper class declaration: `class <Name> < Formula`

3. Define platform-specific URLs

```ruby
if OS.mac? && Hardware::CPU.intel?
  url '...'
end

if OS.mac? && Hardware::CPU.arm?
  url '...'
end

if OS.linux? && Hardware::CPU.intel?
  url '...'
end
```

4. Add installation and testing
   - Implement `def install` method
   - Add `test do` block to verify functionality

5. Run validation
   - Execute `brew audit --strict Formula/<name>.rb`
   - Verify Ruby syntax: `ruby -c Formula/<name>.rb`
   - Run pre-commit hooks: `pre-commit run --all-files`

### Removing a Formula

1. Delete the formula file from `Formula/`
2. Remove any references in `.rubocop_todo.yml`
3. Update documentation in `README.md` if needed
4. Commit with message: "Remove <name> formula and all references"

## Quality Control

### Pre-commit Hooks

All changes must pass pre-commit validation:

- fasterer: Ruby speed improvements
- markdownlint: Markdown formatting
- shellcheck: Shell script validation
- rubocop: Ruby style guide
- git-check: Conflict markers
- reek: Code smells

Run locally before pushing:

```bash
pre-commit run --all-files
```

### GitHub Workflows

Automated checks run on all PRs and pushes to `main`:

- **pre-commit.yml** - Runs pre-commit hooks
- **brew-audit.yml** - Validates formula syntax and audits
- **code-quality.yml** - RuboCop, Reek, and Fasterer checks

## Best Practices

### Formula Updates

- Keep formulas up-to-date with latest stable releases
- Test on both Intel and ARM macOS when possible
- Include SHA256 checksums for security
- Document any known issues or limitations

### Code Style

- Use 2-space indentation (Ruby standard)
- Avoid long lines (follow `.mdlrc` for markdown)
- Include comments for complex logic
- Follow Homebrew naming conventions

### Documentation

- Update `README.md` when adding/removing formulas
- Keep installation instructions current
- Document any special setup required

## Automation Opportunities

Agents can automate:

- Version bump detection and updates
- GitHub release monitoring
- Regular pre-commit config updates
- Workflow maintenance

## Repository Structure

```
homebrew-tap/
  .github/workflows/
    pre-commit.yml
    brew-audit.yml
    code-quality.yml
  Formula/
  .pre-commit-config.yaml
  .rubocop.yml
  .mdlrc
  README.md
  AGENTS.md
  copilotinstructions.md
```

## Support

For questions about Homebrew formula development, consult:

- <https://docs.brew.sh/Formula-Cookbook>
- <https://docs.brew.sh/Taps>
- <https://rubystyle.guide/>
