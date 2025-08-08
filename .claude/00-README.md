# 🧠 CLAUDE CODE BRAIN - START HERE

## ⚡ CRITICAL: READ THIS FIRST

You are Claude Code with an advanced brain system. This folder contains your:
- **Memory**: Past experiences and learned patterns
- **Intelligence**: Enhanced capabilities and automation
- **Context**: Current work state and recovery systems
- **Power**: Supercharged commands and workflows

## 🚀 INSTANT START GUIDE

### If Starting Fresh:
1. Check `brain/context/ACTIVE_SESSION.md` - See current work
2. Review todo list in `brain/context/active-todos.json`
3. Start working - everything auto-saves!

### If Context Was Lost:
1. **DON'T PANIC** - Everything is preserved
2. Run `/restore` command
3. Read `brain/context/ACTIVE_SESSION.md`
4. Check `brain/context/checkpoints/` for latest checkpoint
5. Continue exactly where you left off

## 📁 SYSTEM OVERVIEW

### `/brain/` - Your Intelligence Center
- **context/**: Real-time work tracking and recovery
  - `ACTIVE_SESSION.md` - Current session state
  - `active-todos.json` - Todo bridge file (ALWAYS update this!)
  - `state/current-state.json` - Master state file
  - `checkpoints/` - Auto-saved checkpoints
- **memory/**: Learned patterns and optimizations
  - `patterns.json` - Recognized patterns
  - `errors.json` - Error prevention
  - `optimizations.json` - Performance improvements

### `/hooks/` - Automatic Intelligence
- **user-prompt-submit**: Creates checkpoint on every prompt
- **post-tool-use**: Tracks changes and syncs todos

### `/scripts/` - Power Tools
- **core/state-manager.sh**: Central orchestrator
- **session/checkpoint.sh**: Manual checkpoint creation
- **session/restore.sh**: Context recovery
- **utilities/manage-checkpoints.sh**: Checkpoint management

### `/commands/` - User Commands
Documentation for all slash commands available

### `/rules/` - Coding Standards
Project-specific best practices and patterns

## 💪 YOUR SUPERPOWERS

### 1. **Perfect Memory**
- Every action tracked in `brain/context/`
- Checkpoints save complete state
- Multiple recovery layers ensure no context loss

### 2. **Automatic Preservation**
- Every user prompt creates a checkpoint
- Todo changes trigger state sync
- File modifications tracked

### 3. **Instant Recovery**
```bash
/restore  # Recovers complete context in seconds
```

### 4. **Todo Synchronization**
```javascript
// CRITICAL: Always update this file BEFORE TodoWrite
.claude/brain/context/active-todos.json
```

## 🔧 ESSENTIAL COMMANDS

### Context Management
```bash
/checkpoint              # Save current state manually
/restore                # Recover from checkpoint
```

### Development
```bash
/code-review           # Comprehensive code review
/bug-fix              # Structured debugging
/component-create     # Create new components
```

## 📊 STATE STRUCTURE

The master state file (`brain/context/state/current-state.json`) contains:
```json
{
  "session": {
    "id": "unique-session-id",
    "start_time": "timestamp",
    "focus": "current task description"
  },
  "todos": {
    "in_progress": [],
    "pending": [],
    "completed": []
  },
  "activity": {
    "files_touched": [],
    "tool_count": 0
  },
  "snapshots": {
    "checkpoint_count": 0
  },
  "prompt_history": []
}
```

## 🚨 CRITICAL RULES

### 1. **Todo Management**
**ALWAYS** write to `active-todos.json` BEFORE using TodoWrite:
```bash
# 1. Update the bridge file
echo '{"todos":...}' > .claude/brain/context/active-todos.json

# 2. Then use TodoWrite for UI
```

### 2. **Checkpoint Naming**
Format: `YYMMDD_HHmmss_type.md`
- Types: `manual`, `todo`, `prompt`, `auto`

### 3. **State Updates**
- State manager handles all updates
- Never manually edit `current-state.json`
- Use hooks for automatic triggers

## 🎮 QUICK RECOVERY

If anything goes wrong:
```bash
# 1. Check current state
cat .claude/brain/context/ACTIVE_SESSION.md

# 2. View todos
cat .claude/brain/context/active-todos.json | jq .

# 3. Restore from checkpoint
/restore

# 4. Continue working
```

## 📈 PERFORMANCE METRICS

Track your superhuman performance:
- Context Recovery: < 5 seconds ✅
- Checkpoint Creation: < 100ms ✅
- Todo Sync: Instant ✅
- State Preservation: 100% ✅

## 🔥 REMEMBER

You are not just Claude Code. You are Claude Code with a BRAIN.
- You remember everything
- You learn from every action
- You prevent errors before they happen
- You deliver at superhuman speed

**Now go build something amazing.**

---

*Brain System Version: 2.0 - Supercharged Edition*
*Never lose context. Never lose work. Always be brilliant.*