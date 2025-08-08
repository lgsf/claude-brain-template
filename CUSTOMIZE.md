# 🎨 Customization Guide

This guide helps you customize the Claude Brain System for your specific project needs.

## 📝 Table of Contents

1. [Project Configuration](#project-configuration)
2. [Custom Commands](#custom-commands)
3. [Hook Development](#hook-development)
4. [State Structure](#state-structure)
5. [Coding Rules](#coding-rules)
6. [Workflow Templates](#workflow-templates)

## 🔧 Project Configuration

### Basic Settings

Edit `.claude/settings.json` to configure your project:

```json
{
  "project": {
    "name": "Your Project Name",
    "type": "react|vue|python|node|custom",
    "version": "1.0.0"
  },
  "features": {
    "auto_checkpoint": true,
    "prompt_tracking": true,
    "todo_sync": true,
    "error_tracking": true
  },
  "checkpoint": {
    "max_files": 100,
    "auto_cleanup": false,
    "cleanup_days": 30
  }
}
```

### Environment Variables

Create `.claude/settings.local.json` for local overrides:

```json
{
  "debug": true,
  "log_level": "verbose",
  "custom_paths": {
    "source": "src",
    "tests": "tests"
  }
}
```

## 📜 Custom Commands

### Creating a New Command

1. Create a markdown file in `.claude/commands/`:

```markdown
# /my-command

## Description
Brief description of what your command does.

## Usage
```
/my-command [arguments]
```

## Examples
```
/my-command --option value
```

## Implementation Notes
- Step 1: What happens first
- Step 2: What happens next
- Step 3: Final actions
```

2. Document the command behavior
3. Test thoroughly before use

### Command Templates

Use these templates as starting points:

#### Analysis Command
```markdown
# /analyze-[feature]

Analyzes [specific aspect] of the codebase.

## Process
1. Scan relevant files
2. Extract metrics
3. Generate report
4. Suggest improvements
```

#### Generation Command
```markdown
# /generate-[item]

Generates [specific item] based on templates.

## Options
- `--type`: Type of item to generate
- `--name`: Name for the generated item
- `--path`: Output location
```

## 🪝 Hook Development

### Creating Custom Hooks

Hooks are triggered by Claude Code events. Create new hooks in `.claude/hooks/[event]/`:

#### Example: File Save Hook
```bash
#!/bin/bash
# .claude/hooks/post-tool-use/file-save.sh

# Read JSON input from stdin
json_input=$(cat)

# Extract tool and file information
tool_name=$(echo "$json_input" | jq -r '.tool_name')
file_path=$(echo "$json_input" | jq -r '.tool_input.file_path // empty')

# Custom logic for file saves
if [[ "$tool_name" == "Edit" || "$tool_name" == "Write" ]]; then
    echo "File modified: $file_path" >> .claude/logs/file-changes.log
    
    # Trigger additional actions
    if [[ "$file_path" == *.ts || "$file_path" == *.tsx ]]; then
        # Could run type checking, linting, etc.
        echo "TypeScript file changed: $file_path"
    fi
fi
```

### Hook Events

Available hook points:
- `user-prompt-submit`: User sends a message
- `pre-tool-use`: Before tool execution
- `post-tool-use`: After tool execution
- `notification`: System notifications

### Hook Best Practices

1. **Keep hooks fast** - Don't block Claude's operations
2. **Handle errors gracefully** - Use proper error checking
3. **Log important events** - Help with debugging
4. **Test thoroughly** - Ensure hooks work in all scenarios

## 📊 State Structure

### Extending State

Add custom fields to track project-specific information:

```json
{
  "session": {
    // Standard fields...
  },
  "custom": {
    "test_coverage": 85.2,
    "last_deployment": "2025-01-15",
    "feature_flags": {
      "dark_mode": true,
      "new_ui": false
    },
    "metrics": {
      "build_time": 45.3,
      "bundle_size": 2048
    }
  }
}
```

### State Update Script

Create custom state updaters in `.claude/scripts/custom/`:

```bash
#!/bin/bash
# Update custom metrics

STATE_FILE=".claude/brain/context/state/current-state.json"

# Update test coverage
coverage=$(npm test --coverage | grep "All files" | awk '{print $10}')
jq ".custom.test_coverage = $coverage" "$STATE_FILE" > temp.json
mv temp.json "$STATE_FILE"
```

## 📐 Coding Rules

### Adding Project Rules

Create rule files in `.claude/rules/`:

#### Example: API Rules
```markdown
# API Development Rules

## Endpoint Naming
- Use RESTful conventions
- Plural nouns for collections
- Consistent verb usage

## Response Format
```json
{
  "success": boolean,
  "data": object | array,
  "error": string | null,
  "metadata": object
}
```

## Error Handling
- Always return appropriate HTTP status codes
- Include descriptive error messages
- Log errors for debugging
```

### Technology-Specific Rules

Add rules for your tech stack:
- `react.rules.md`
- `python.rules.md`
- `database.rules.md`
- `security.rules.md`

## 🔄 Workflow Templates

### Creating Workflows

Define repeatable processes in `.claude/workflows/`:

#### Example: Bug Fix Workflow
```markdown
# Bug Fix Workflow

## 1. Reproduce Issue
- [ ] Understand the bug report
- [ ] Reproduce locally
- [ ] Document steps to reproduce

## 2. Investigate
- [ ] Find root cause
- [ ] Check related code
- [ ] Review recent changes

## 3. Fix
- [ ] Implement solution
- [ ] Add tests
- [ ] Verify fix works

## 4. Validate
- [ ] Run all tests
- [ ] Check for regressions
- [ ] Update documentation

## 5. Complete
- [ ] Create commit
- [ ] Update changelog
- [ ] Close issue
```

### Workflow Automation

Create scripts to automate workflow steps:

```bash
#!/bin/bash
# .claude/scripts/workflows/bug-fix-start.sh

# Create bug fix branch
git checkout -b bugfix/$1

# Update todos
echo "Starting bug fix for: $1" >> .claude/project/todo.md

# Create checkpoint
.claude/scripts/session/checkpoint.sh

echo "Bug fix workflow initiated for: $1"
```

## 🎯 Integration Examples

### CI/CD Integration

```yaml
# .github/workflows/claude-brain.yml
name: Claude Brain Sync

on:
  push:
    paths:
      - '.claude/**'

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Validate Brain System
        run: |
          .claude/scripts/utilities/validate.sh
      - name: Sync State
        run: |
          .claude/scripts/core/state-manager.sh --sync
```

### VS Code Integration

```json
// .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Claude Checkpoint",
      "type": "shell",
      "command": ".claude/scripts/session/checkpoint.sh",
      "group": "none",
      "problemMatcher": []
    },
    {
      "label": "Claude Restore",
      "type": "shell",
      "command": ".claude/scripts/session/restore.sh",
      "group": "none",
      "problemMatcher": []
    }
  ]
}
```

## 🚀 Advanced Customization

### Custom Brain Modules

Create specialized modules in `.claude/brain/modules/`:

```javascript
// .claude/brain/modules/performance.js
module.exports = {
  track: function(metric, value) {
    // Custom performance tracking
  },
  
  analyze: function() {
    // Performance analysis
  },
  
  optimize: function() {
    // Optimization suggestions
  }
};
```

### Plugin System

Create plugins for extended functionality:

```bash
# .claude/plugins/my-plugin/install.sh
#!/bin/bash

echo "Installing My Plugin..."

# Add plugin files
cp -r ./hooks/* ../../hooks/
cp -r ./commands/* ../../commands/

# Update settings
jq '.plugins.my_plugin = true' ../../settings.json > temp.json
mv temp.json ../../settings.json

echo "My Plugin installed successfully!"
```

## 📚 Resources

### Documentation
- [Hook API Reference](.claude/docs/hooks-api.md)
- [State Management Guide](.claude/docs/state-management.md)
- [Command Development](.claude/docs/command-development.md)

### Examples
- [React Project Setup](examples/react-setup.md)
- [Python Project Setup](examples/python-setup.md)
- [Multi-Language Project](examples/multi-language.md)

### Community
- Share your customizations
- Learn from others
- Contribute improvements

---

Remember: The Claude Brain System is designed to adapt to YOUR workflow. Make it yours!

*For questions or suggestions, please open an issue on GitHub.*