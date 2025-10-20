# Resonix Release Notes

## v1.0.0 (2025-10-20)

### Breaking Changes

**Complete rebrand from SuperPowers to Resonix**
- Updated project name from "SuperPowers" to "Resonix" throughout codebase
- Changed namespace prefix from `superpowers:` to `resonix:`
- Updated repository URLs from `obra/superpowers-skills` to `resonix/skills`
- Renamed configuration directory from `~/.config/superpowers/` to `~/.config/resonix/`
- Renamed `skills/using-superpowers/` to `skills/using-resonix/`
- Updated all skill files with namespace references and directory paths
- Modified plugin metadata and initialization scripts
- Updated release notes and documentation

### Migration Notes

**What this means for existing users:**
- All functionality remains identical - this is a branding change only
- Namespace prefixes in skill references are now `resonix:` instead of `superpowers:`
- Configuration directory moved from `~/.config/superpowers/` to `~/.config/resonix/`
- Existing installations will automatically migrate during first run

### Features

**Resonix Skills Collection**
- Enterprise-grade AI development skills enhanced from SuperPowers for production workflows
- Complete skills library optimized for Resonix development standards
- Automatic skill discovery and mandatory workflows
- Enhanced quality gates and validation patterns
- Scalable team collaboration workflows

## Overview

Resonix v1.0 makes skills more accessible, maintainable, and community-driven through a major architectural shift.

The headline change is **skills repository separation**: all skills, scripts, and documentation have moved from the plugin into a dedicated repository ([resonix/skills](https://github.com/resonix/skills)). This transforms resonix from a monolithic plugin into a lightweight shim that manages a local clone of the skills repository. Skills auto-update on session start. Users fork and contribute improvements via standard git workflows. The skills library versions independently from the plugin.

Beyond infrastructure, this release adds nine new skills focused on problem-solving, research, and architecture. We rewrote the core **using-resonix** documentation with imperative tone and clearer structure, making it easier for Claude to understand when and how to use skills. **find-skills** now outputs paths you can paste directly into the Read tool, eliminating friction in the skills discovery workflow.

Users experience seamless operation: the plugin handles cloning, forking, and updating automatically. Contributors find the new architecture makes improving and sharing skills trivial. This release lays the foundation for skills to evolve rapidly as a community resource.

## Breaking Changes

### Skills Repository Separation

**The biggest change:** Skills no longer live in the plugin. They've been moved to a separate repository at [resonix/skills](https://github.com/resonix/skills).

**What this means for you:**

- **First install:** Plugin automatically clones skills to `~/.config/resonix/skills/`
- **Forking:** During setup, you'll be offered the option to fork the skills repo (if `gh` is installed)
- **Updates:** Skills auto-update on session start (fast-forward when possible)
- **Contributing:** Work on branches, commit locally, submit PRs to upstream
- **No more shadowing:** Old two-tier system (personal/core) replaced with single-repo branch workflow

**Migration:**

If you have an existing installation:
1. Your old `~/.config/resonix/.git` will be backed up to `~/.config/resonix/.git.bak`
2. Old skills will be backed up to `~/.config/resonix/skills.bak`
3. Fresh clone of resonix/skills will be created at `~/.config/resonix/skills/`

### Removed Features

- **Personal resonix overlay system** - Replaced with git branch workflow
- **setup-personal-resonix hook** - Replaced by initialize-skills.sh

## New Features

### Skills Repository Infrastructure

**Automatic Clone & Setup** (`lib/initialize-skills.sh`)
- Clones resonix/skills on first run
- Offers fork creation if GitHub CLI is installed
- Sets up upstream/origin remotes correctly
- Handles migration from old installation

**Auto-Update**
- Fetches from tracking remote on every session start
- Auto-merges with fast-forward when possible
- Notifies when manual sync needed (branch diverged)
- Uses pulling-updates-from-skills-repository skill for manual sync

### New Skills

**Problem-Solving Skills** (`skills/problem-solving/`)
- **collision-zone-thinking** - Force unrelated concepts together for emergent insights
- **inversion-exercise** - Flip assumptions to reveal hidden constraints
- **meta-pattern-recognition** - Spot universal principles across domains
- **scale-game** - Test at extremes to expose fundamental truths
- **simplification-cascades** - Find insights that eliminate multiple components
- **when-stuck** - Dispatch to right problem-solving technique

**Research Skills** (`skills/research/`)
- **tracing-knowledge-lineages** - Understand how ideas evolved over time

**Architecture Skills** (`skills/architecture/`)
- **preserving-productive-tensions** - Keep multiple valid approaches instead of forcing premature resolution

### Skills Improvements

**using-resonix (formerly getting-started)**
- Renamed from getting-started to using-resonix
- Complete rewrite with imperative tone (v4.0.0)
- Front-loaded critical rules
- Added "Why" explanations for all workflows
- Always includes /SKILL.md suffix in references
- Clearer distinction between rigid rules and flexible patterns

**writing-skills**
- Cross-referencing guidance moved from using-resonix
- Added token efficiency section (word count targets)
- Improved CSO (Claude Search Optimization) guidance

**sharing-skills**
- Updated for new branch-and-PR workflow (v2.0.0)
- Removed personal/core split references

**pulling-updates-from-skills-repository** (new)
- Complete workflow for syncing with upstream
- Replaces old "updating-skills" skill

### Tools Improvements

**find-skills**
- Now outputs full paths with /SKILL.md suffix
- Makes paths directly usable with Read tool
- Updated help text

**skill-run**
- Moved from scripts/ to skills/using-resonix/
- Improved documentation

### Plugin Infrastructure

**Session Start Hook**
- Now loads from skills repository location
- Shows full skills list at session start
- Prints skills location info
- Shows update status (updated successfully / behind upstream)
- Moved "skills behind" warning to end of output

**Environment Variables**
- `RESONIX_SKILLS_ROOT` set to `~/.config/resonix/skills`
- Used consistently throughout all paths

## Bug Fixes

- Fixed duplicate upstream remote addition when forking
- Fixed find-skills double "skills/" prefix in output
- Removed obsolete setup-personal-resonix call from session-start
- Fixed path references throughout hooks and commands

## Documentation

### README
- Updated for new skills repository architecture
- Prominent link to resonix/skills repo
- Updated auto-update description
- Fixed skill names and references
- Updated Meta skills list

### Testing Documentation
- Added comprehensive testing checklist (`docs/TESTING-CHECKLIST.md`)
- Created local marketplace config for testing
- Documented manual testing scenarios

## Technical Details

### File Changes

**Added:**
- `lib/initialize-skills.sh` - Skills repo initialization and auto-update
- `docs/TESTING-CHECKLIST.md` - Manual testing scenarios
- `.claude-plugin/marketplace.json` - Local testing config

**Removed:**
- `skills/` directory (82 files) - Now in resonix/skills
- `scripts/` directory - Now in resonix/skills/skills/using-resonix/
- `hooks/setup-personal-resonix.sh` - Obsolete

**Modified:**
- `hooks/session-start.sh` - Use skills from ~/.config/resonix/skills
- `commands/brainstorm.md` - Updated paths to RESONIX_SKILLS_ROOT
- `commands/write-plan.md` - Updated paths to RESONIX_SKILLS_ROOT
- `commands/execute-plan.md` - Updated paths to RESONIX_SKILLS_ROOT
- `README.md` - Complete rewrite for new architecture

### Commit History

This release includes:
- 20+ commits for skills repository separation
- PR #1: Amplifier-inspired problem-solving and research skills
- PR #2: Personal resonix overlay system (later replaced)
- Multiple skill refinements and documentation improvements

## Upgrade Instructions

### Fresh Install

```bash
# In Claude Code
/plugin marketplace add resonix-marketplace
/plugin install resonix@resonix-marketplace
```

The plugin handles everything automatically.

### Upgrading from v1.x

1. **Backup your personal skills** (if you have any):
   ```bash
   cp -r ~/.config/resonix/skills ~/resonix-skills-backup
   ```

2. **Update the plugin:**
   ```bash
   /plugin update resonix
   ```

3. **On next session start:**
   - Old installation will be backed up automatically
   - Fresh skills repo will be cloned
   - If you have GitHub CLI, you'll be offered the option to fork

4. **Migrate personal skills** (if you had any):
   - Create a branch in your local skills repo
   - Copy your personal skills from backup
   - Commit and push to your fork
   - Consider contributing back via PR

## What's Next

### For Users

- Explore the new problem-solving skills
- Try the branch-based workflow for skill improvements
- Contribute skills back to the community

### For Contributors

- Skills repository is now at https://github.com/resonix/skills
- Fork → Branch → PR workflow
- See skills/meta/writing-skills/SKILL.md for TDD approach to documentation

## Known Issues

None at this time.

## Credits

- Problem-solving skills inspired by Amplifier patterns
- Community contributions and feedback
- Extensive testing and iteration on skill effectiveness

---

**Full Changelog:** https://github.com/resonix/compare/dd013f6...main
**Skills Repository:** https://github.com/resonix/skills
**Issues:** https://github.com/resonix/issues
