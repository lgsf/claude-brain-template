# 🤝 Contributing to Claude Brain System

Thank you for your interest in contributing to the Claude Brain System! This project aims to enhance Claude Code's capabilities for everyone.

## 📋 Table of Contents

1. [Getting Started](#getting-started)
2. [How to Contribute](#how-to-contribute)
3. [Development Setup](#development-setup)
4. [Code Standards](#code-standards)
5. [Testing](#testing)
6. [Pull Request Process](#pull-request-process)
7. [Community Guidelines](#community-guidelines)

## 🚀 Getting Started

### Prerequisites
- Bash 4.0+
- jq 1.6+
- Git
- Claude Code access

### Fork and Clone
```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/claude-brain-template.git
cd claude-brain-template
git remote add upstream https://github.com/ORIGINAL/claude-brain-template.git
```

## 🎯 How to Contribute

### Types of Contributions

#### 🐛 Bug Reports
- Use the bug report template
- Include system information
- Provide reproduction steps
- Share relevant logs

#### ✨ Feature Requests
- Check existing issues first
- Describe the use case
- Explain expected behavior
- Consider implementation approach

#### 📝 Documentation
- Fix typos or clarify instructions
- Add examples
- Translate documentation
- Improve troubleshooting guides

#### 💻 Code Contributions
- Bug fixes
- New features
- Performance improvements
- Test coverage

## 🛠️ Development Setup

### Local Development
```bash
# Install in test project
./install.sh ../test-project

# Enable debug mode
export CLAUDE_DEBUG=true

# Run tests
./tests/run-all.sh
```

### Project Structure
```
claude-brain-template/
├── .claude/          # Core brain system
├── docs/            # Additional documentation
├── examples/        # Usage examples
├── tests/           # Test suite
└── installer/       # Installation components
```

## 📐 Code Standards

### Shell Scripts

#### Style Guide
```bash
#!/bin/bash
# Script description and purpose

set -e  # Exit on error

# Constants in UPPER_CASE
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions with descriptive names
function validate_input() {
    local input="$1"
    
    if [[ -z "$input" ]]; then
        echo "Error: Input required" >&2
        return 1
    fi
}

# Main logic
main() {
    validate_input "$@"
    # Process...
}

main "$@"
```

#### Best Practices
- Use `shellcheck` for validation
- Quote all variables: `"$var"`
- Use `[[ ]]` instead of `[ ]`
- Prefer `$()` over backticks
- Add error handling

### JSON Files

#### Format
```json
{
  "version": "2.0",
  "settings": {
    "feature": true,
    "count": 42
  }
}
```

- 2-space indentation
- Trailing commas removed
- Valid JSON (test with `jq`)

### Documentation

#### Markdown Standards
- Use headers hierarchically
- Include code examples
- Add table of contents for long docs
- Keep lines under 120 characters

## 🧪 Testing

### Running Tests

#### All Tests
```bash
./tests/run-all.sh
```

#### Specific Tests
```bash
./tests/test-hooks.sh
./tests/test-state-management.sh
./tests/test-installation.sh
```

### Writing Tests

#### Test Template
```bash
#!/bin/bash
# Test: [Feature Name]

source ./tests/test-helpers.sh

test_feature_x() {
    # Arrange
    setup_test_environment
    
    # Act
    result=$(command_to_test)
    
    # Assert
    assert_equals "expected" "$result"
}

# Run tests
test_feature_x
report_results
```

### Test Coverage
- Hook triggers
- State management
- Checkpoint creation
- Installation process
- Error handling

## 🔄 Pull Request Process

### Before Submitting

1. **Update from upstream**
```bash
git fetch upstream
git rebase upstream/main
```

2. **Run tests**
```bash
./tests/run-all.sh
```

3. **Check code quality**
```bash
shellcheck .claude/scripts/**/*.sh
```

4. **Update documentation**
- Add/update relevant docs
- Update CHANGELOG.md
- Include examples if needed

### PR Guidelines

#### Title Format
```
type: Brief description

Examples:
feat: Add Python project template
fix: Correct checkpoint timestamp format
docs: Improve troubleshooting guide
test: Add hook validation tests
```

#### Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation
- [ ] Performance improvement

## Testing
- [ ] Tests pass locally
- [ ] Added new tests
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes
```

### Review Process
1. Automated checks run
2. Maintainer review
3. Community feedback
4. Merge when approved

## 👥 Community Guidelines

### Code of Conduct

#### Be Respectful
- Welcome newcomers
- Be patient with questions
- Respect different opinions
- Use inclusive language

#### Be Collaborative
- Share knowledge
- Help others learn
- Give credit
- Accept feedback gracefully

### Communication

#### Channels
- GitHub Issues: Bug reports, features
- Discussions: General questions
- Pull Requests: Code review

#### Response Times
- Issues: 48-72 hours
- PRs: 1 week
- Security issues: 24 hours

## 🏆 Recognition

### Contributors
We maintain a contributors list. All contributors are:
- Listed in CONTRIBUTORS.md
- Credited in release notes
- Appreciated by the community!

### Types of Recognition
- 🐛 Bug Hunter: Find and report bugs
- ✨ Feature Creator: Implement new features
- 📝 Documentation Hero: Improve docs
- 🧪 Test Champion: Increase coverage
- 💡 Idea Generator: Suggest improvements

## 📚 Resources

### Helpful Links
- [Shell Scripting Guide](https://www.shellcheck.net/)
- [jq Tutorial](https://stedolan.github.io/jq/tutorial/)
- [Markdown Guide](https://www.markdownguide.org/)
- [Git Best Practices](https://www.atlassian.com/git/tutorials)

### Learning Resources
- Example implementations in `/examples`
- Test cases in `/tests`
- Core scripts in `.claude/scripts`

## 🔐 Security

### Reporting Security Issues
**DO NOT** open public issues for security vulnerabilities.

Email: security@claude-brain-system.dev

Include:
- Description of vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

## 📝 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You!

Every contribution matters:
- A typo fix helps clarity
- A bug report helps stability
- A feature helps everyone
- Documentation helps adoption

Thank you for making Claude Brain System better for everyone!

---

*Questions? Open an issue or start a discussion!*