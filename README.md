# Resonix Skills Collection

A curated collection of advanced AI development skills from the [Resonix](https://github.com/resonix/skills) project, adapted and enhanced for Resonix development workflows.

## What You Get

A comprehensive skills library optimized for Resonix development standards:

- **Testing Skills** - TDD, async testing, anti-patterns
- **Debugging Skills** - Systematic debugging, root cause tracing, verification
- **Collaboration Skills** - Brainstorming, planning, code review, parallel agents
- **Development Skills** - Git worktrees, finishing branches, subagent workflows
- **Meta Skills** - Creating, testing, and sharing skills

## Resonix Enhancement

This collection has been specifically enhanced for Resonix workflows with:

- **Enterprise-grade quality gates** and validation patterns
- **Scalable team collaboration** workflows
- **Production-ready debugging** and troubleshooting approaches
- **Systematic code review** processes for complex systems
- **Advanced testing strategies** for distributed applications

## Origin

This collection is adapted from the Resonix project originally created by Brandon Keepers, enhanced for Resonix development standards and workflows. All credit for the original skills and framework goes to 

- **Adapted for**: Resonix Development Team

## Quick Start

### Explore Skills

Skills are organized in the `skills/` directory by category:

**Testing** (`skills/testing/`)
- **test-driven-development** - RED-GREEN-REFACTOR cycle
- **condition-based-waiting** - Async test patterns
- **testing-anti-patterns** - Common pitfalls to avoid

**Debugging** (`skills/debugging/`)
- **systematic-debugging** - 4-phase root cause process
- **root-cause-tracing** - Find the real problem
- **verification-before-completion** - Ensure it's actually fixed
- **defense-in-depth** - Multiple validation layers

**Collaboration** (`skills/collaboration/`)
- **brainstorming** - Socratic design refinement
- **writing-plans** - Detailed implementation plans
- **executing-plans** - Batch execution with checkpoints
- **dispatching-parallel-agents** - Concurrent subagent workflows
- **requesting-code-review** - Pre-review checklist
- **receiving-code-review** - Responding to feedback
- **using-git-worktrees** - Parallel development branches
- **finishing-a-development-branch** - Merge/PR decision workflow
- **subagent-driven-development** - Fast iteration with quality gates

**Meta** (`skills/meta/`)
- **writing-skills** - Create new skills following best practices
- **sharing-skills** - Contribute skills back via branch and PR
- **testing-skills-with-subagents** - Validate skill quality
- **using-resonix** - Introduction to the skills system

### Commands

Available slash commands (wrappers around skills):

- **brainstorm.md** - Activates the `brainstorming` skill
- **write-plan.md** - Activates the `writing-plans` skill
- **execute-plan.md** - Activates the `executing-plans` skill

## How It Works

1. **Skills System** - Uses Claude Code's first-party skills system
2. **Automatic Discovery** - Claude finds and uses relevant skills for your task
3. **Mandatory Workflows** - When a skill exists for your task, using it becomes required

## Philosophy

**Core Resonix Principles:**
- **Test-Driven Development** - Write tests first, always
- **Systematic over ad-hoc** - Process over guessing
- **Complexity reduction** - Simplicity as primary goal
- **Evidence over claims** - Verify before declaring success
- **Domain over implementation** - Work at problem level, not solution level

**Resonix Enhancement Principles:**
- **Enterprise scalability** - Solutions that scale to team and production size
- **Quality-first development** - Built-in validation and review processes
- **Systematic troubleshooting** - Debugging processes for complex distributed systems
- **Collaborative excellence** - Workflows optimized for team coordination
- **Production readiness** - Skills designed for real-world deployment scenarios

## License

MIT License - same as original Resonix project. See [LICENSE](LICENSE) file for details.



