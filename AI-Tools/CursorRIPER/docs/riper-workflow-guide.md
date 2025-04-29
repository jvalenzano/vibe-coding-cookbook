![CursorRIPER](../res/github-header.png)
# CursorRIPER Framework - RIPER Workflow Guide

The RIPER workflow is the core component of the CursorRIPER Framework, providing a structured approach to software development through five distinct operational modes. This guide explains how to use each mode effectively.

## RIPER Workflow Overview

```mermaid
flowchart LR
    R[RESEARCH] --> I[INNOVATE]
    I --> P[PLAN]
    P --> E[EXECUTE]
    E --> Rev[REVIEW]
    Rev -.-> R
    
    style R fill:#e6f3ff,stroke:#0066cc
    style I fill:#e6ffe6,stroke:#006600
    style P fill:#fff0e6,stroke:#cc6600
    style E fill:#ffe6e6,stroke:#cc0000
    style Rev fill:#f0e6ff,stroke:#6600cc
```

## Mode 1: RESEARCH

### Purpose
Information gathering and understanding existing code.

### When to Use
- At the beginning of a new feature or bugfix
- When encountering unfamiliar code
- When you need to understand how something works

### Commands
- `/research` or `ENTER RESEARCH MODE`

### Example Prompts
- "I need to understand how the authentication system works."
- "Can you analyze the data flow in the payment processing module?"
- "Help me understand the existing implementation of the shopping cart."

### Best Practices
1. Be specific about what you want to understand
2. Provide context by @-mentioning relevant files
3. Ask follow-up questions to deepen understanding
4. Take time to thoroughly understand before moving to INNOVATE

## Mode 2: INNOVATE

### Purpose
Brainstorming potential approaches and solutions.

### When to Use
- After gathering information in RESEARCH mode
- When exploring different approaches to a problem
- When you need creative solutions

### Commands
- `/innovate` or `ENTER INNOVATE MODE`

### Example Prompts
- "What are some approaches to implement the user notification system?"
- "Let's brainstorm different ways to optimize the database queries."
- "Help me think through different architectural options for the new feature."

### Best Practices
1. Consider multiple approaches rather than settling on the first idea
2. Discuss pros and cons of each approach
3. Explore trade-offs between different solutions
4. Don't commit to a specific implementation yet
5. Document key decisions and rationales

## Mode 3: PLAN

### Purpose
Creating detailed technical specifications.

### When to Use
- After selecting an approach in INNOVATE mode
- When you need a comprehensive implementation plan
- Before making significant code changes

### Commands
- `/plan` or `ENTER PLAN MODE`

### Example Prompts
- "Create a detailed plan for implementing the user notification system."
- "Let's develop a step-by-step plan for refactoring the payment processing module."
- "Help me plan the implementation of the new feature."

### Planning Process
1. The AI will deeply reflect on the changes needed
2. Analyze existing code to map the full scope of changes
3. Ask 4-6 clarifying questions to refine the plan
4. Draft a comprehensive plan of action
5. Convert the plan into a numbered, sequential checklist

### Best Practices
1. Answer clarifying questions thoroughly
2. Review the plan carefully before approving
3. Ensure the plan covers all aspects of the implementation
4. Verify that all file paths and function names are correct
5. Consider potential side effects of the planned changes

## Mode 4: EXECUTE

### Purpose
Implementing exactly what was planned in PLAN mode.

### When to Use
- After approving a plan in PLAN mode
- When you're ready to implement changes
- When you have a clear, approved plan to follow

### Commands
- `/execute` or `ENTER EXECUTE MODE`

### Example Prompts
- "Let's start implementing the approved plan."
- "Implement steps 1-3 from the plan."
- "Continue execution from step 4."

### Best Practices
1. Only enter EXECUTE mode after a plan is approved
2. Follow the plan exactly as specified
3. Track progress against the checklist
4. If any issues arise that require deviation, return to PLAN mode
5. Update memory bank files as you make progress

## Mode 5: REVIEW

### Purpose
Validating implementation against the plan.

### When to Use
- After completing implementation in EXECUTE mode
- When you want to verify changes match the plan
- Before committing or merging changes

### Commands
- `/review` or `ENTER REVIEW MODE`

### Example Prompts
- "Let's review the implementation against our plan."
- "Validate the changes we just made."
- "Review steps 1-5 to ensure they match the plan."

### Best Practices
1. Be thorough in reviewing all changes
2. Pay attention to any deviation flags
3. Decide whether deviations are acceptable or need to be fixed
4. Document any deviations and their rationales
5. Update memory bank files with review findings

## Mode Transitions

You can transition between modes at any time using the appropriate command. The typical workflow follows the RIPER sequence:

1. Start with RESEARCH to understand the problem
2. Move to INNOVATE to explore potential solutions
3. Transition to PLAN to create a detailed implementation plan
4. Enter EXECUTE to implement the plan
5. Finally, use REVIEW to validate the implementation

However, you can move between modes as needed, except for EXECUTE mode which requires an approved plan from PLAN mode.

## Memory Bank Updates

As you progress through the RIPER workflow, the framework will automatically update memory bank files:

- `activeContext.md` - Updated with current focus and changes
- `progress.md` - Tracks implementation progress
- `systemPatterns.md` - Documents architectural decisions

Keep these files up to date to maintain context across sessions.

---

*The CursorRIPER Framework prevents coding disasters while maintaining perfect continuity across sessions.*
