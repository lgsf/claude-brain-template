# 🧠 Claude Brain System - SUPERCHARGED Edition

> Transform Claude Code into a genius with perfect memory, automatic preservation, and intelligent automation.

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com/yourusername/claude-brain-template)
[![Installation](https://img.shields.io/badge/install-<2min-green.svg)](https://github.com/yourusername/claude-brain-template)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

## 🚀 What is Claude Brain?

Claude Brain is a comprehensive intelligence system that supercharges Claude Code with:

- **🔄 Perfect Memory**: Never lose context again with automatic checkpointing
- **📝 Smart Todo Management**: Automatic synchronization of tasks across sessions
- **⚡ Instant Recovery**: Restore complete context in seconds
- **🎯 Intelligent Automation**: Hooks that enhance every action
- **📊 State Tracking**: Real-time monitoring of all activities
- **🧬 Self-Learning**: Pattern recognition and optimization

## ⚡ Quick Install (< 2 minutes)

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-brain-template.git

# Run the installer
cd claude-brain-template
./install.sh /path/to/your/project
```

That's it! Your Claude Code is now SUPERCHARGED! 🎉

## 🎯 Core Features

### 1. **Automatic Checkpointing**
Every prompt creates a checkpoint automatically. Never lose work again.

```bash
# Manual checkpoint
/checkpoint

# Restore from checkpoint
/restore
```

### 2. **Todo Synchronization**
Todos sync automatically between Claude's UI and the brain system.

```javascript
// Any TodoWrite automatically syncs to:
.claude/brain/context/active-todos.json
.claude/brain/context/state/current-state.json
```

### 3. **Context Preservation**
Complete session state preserved in multiple layers:
- Active session tracking
- State snapshots
- Checkpoint history
- Prompt history

### 4. **Hook System**
Automatic triggers on:
- User prompts (creates checkpoints)
- Tool usage (tracks changes)
- File modifications (updates state)

### 5. **Learning System**
- Pattern recognition
- Error prevention
- Performance optimization
- Decision tracking

## 📁 What Gets Installed

```
your-project/
├── .claude/                    # Brain system root
│   ├── brain/                  # Intelligence center
│   │   ├── context/           # Live state & checkpoints
│   │   └── memory/            # Learning system
│   ├── hooks/                 # Automation triggers
│   ├── scripts/               # Utility scripts
│   ├── commands/              # Slash commands
│   └── rules/                 # Coding standards
└── CLAUDE.md                   # Project instructions
```

## 🔧 Configuration

### Basic Setup (Zero Config)
The system works out of the box with sensible defaults.

### Advanced Customization
Edit `.claude/settings.json`:

```json
{
  "features": {
    "auto_checkpoint": true,
    "prompt_tracking": true,
    "todo_sync": true,
    "state_tracking": true
  },
  "checkpoint": {
    "max_checkpoints": 100,
    "auto_cleanup": false
  }
}
```

## 🎮 Essential Commands

| Command | Description |
|---------|-------------|
| `/checkpoint` | Create manual checkpoint |
| `/restore` | Restore from last checkpoint |
| `/status` | View current state |
| `/todos` | Show todo list |
| `/history` | View prompt history |

## 🚨 Recovery Instructions

If Claude loses context:

1. **Quick Recovery**
   ```bash
   /restore
   ```

2. **Manual Recovery**
   ```bash
   cat .claude/brain/context/ACTIVE_SESSION.md
   ```

3. **Full State Check**
   ```bash
   cat .claude/brain/context/state/current-state.json | jq .
   ```

## 📊 How It Works

### State Flow
```
User Prompt → Hook Trigger → State Update → Checkpoint → Preservation
     ↓            ↓              ↓              ↓            ↓
  Captured    Auto-save      Tracked      Versioned    Recoverable
```

### File Synchronization
```
TodoWrite → active-todos.json → state-manager.sh → current-state.json
                   ↓                    ↓                  ↓
             Bridge File          Orchestrator       Master State
```

## 🛠️ Project Type Support

Pre-configured templates for:
- ✅ React + TypeScript
- ✅ Vue.js
- ✅ Python/Django
- ✅ Node.js/Express
- ✅ Custom projects

## 📈 Performance Impact

- **Memory Usage**: < 10MB
- **Checkpoint Time**: < 100ms
- **Recovery Time**: < 5 seconds
- **CPU Impact**: Negligible

## 🔐 Security

- No sensitive data in checkpoints
- Gitignore templates included
- Local-only storage
- Optional encryption support

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📚 Documentation

- [Installation Guide](docs/INSTALL.md)
- [Customization Guide](docs/CUSTOMIZE.md)
- [Architecture Overview](docs/ARCHITECTURE.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## 💡 Tips & Tricks

### 1. **Keep Checkpoints Clean**
```bash
# View checkpoint stats
.claude/scripts/utilities/manage-checkpoints.sh stats

# Clean old checkpoints
.claude/scripts/utilities/manage-checkpoints.sh clean 30
```

### 2. **Custom Commands**
Add your own commands in `.claude/commands/`:
```markdown
# .claude/commands/my-command.md
Your custom command documentation
```

### 3. **Project-Specific Rules**
Add coding standards in `.claude/rules/`:
```markdown
# .claude/rules/my-rules.md
Your project-specific rules
```

## 🐛 Troubleshooting

### Brain System Not Working?
```bash
# Run health check
./health-check.sh

# Reinstall
./install.sh --repair
```

### Checkpoints Not Creating?
Check hook permissions:
```bash
ls -la .claude/hooks/*/trigger.sh
```

### State Not Syncing?
Verify state file:
```bash
jq . .claude/brain/context/state/current-state.json
```

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Built with ❤️ for the Claude Code community.

## 🔗 Links

- [GitHub Repository](https://github.com/yourusername/claude-brain-template)
- [Issue Tracker](https://github.com/yourusername/claude-brain-template/issues)
- [Discussions](https://github.com/yourusername/claude-brain-template/discussions)

---

**Remember**: You're not just using Claude Code. You're using Claude Code with a BRAIN! 🧠⚡

*Current Version: 2.0 - Supercharged Edition*