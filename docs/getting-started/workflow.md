---
layout: default
title: Understanding Vibe Coding Workflow
parent: Getting Started Guide
nav_order: 4
permalink: /docs/getting-started/workflow
---

# Understanding Vibe Coding Workflow

The Vibe Coding Workflow combines the best elements of the BMAD Method and CursorRIPER Framework to create a cohesive development process.

## Workflow Overview

<div class="mermaid">
graph TD
    A[Project Idea] --> B[BMAD Business Analyst: <br> Gather Requirements]
    B --> C[BMAD Architect: <br> Design System]
    C --> D[CursorRIPER Plan: <br> Implementation Strategy]
    D --> E[CursorRIPER Execute: <br> Generate Code]
    E --> F[CursorRIPER Review: <br> Test & Optimize]
    F --> G[Project Delivery]
    
    style A fill:#f9f9f9,stroke:#ccc
    style B fill:#e8eaf6,stroke:#5E35B1
    style C fill:#e8eaf6,stroke:#5E35B1
    style D fill:#e0f2f1,stroke:#00897B
    style E fill:#e0f2f1,stroke:#00897B
    style F fill:#e0f2f1,stroke:#00897B
    style G fill:#f9f9f9,stroke:#ccc
</div>

## Phases Explained

### 1. Requirements Gathering (BMAD Business Analyst)

The Business Analyst persona focuses on understanding:
- User needs and pain points
- Business objectives
- Functional requirements
- Non-functional requirements

**Example Prompt:**
```
As a Business Analyst, gather requirements for a user authentication system. Consider security requirements, user experience, and industry best practices.
```

### 2. System Design (BMAD Architect)

The Architect persona designs the system architecture:
- Component design
- Data models
- API specifications
- Technology stack decisions

**Example Prompt:**
```
As a Software Architect, design a scalable microservice architecture for our e-commerce platform that needs to handle 10,000+ concurrent users.
```

### 3. Implementation Planning (CursorRIPER Plan)

The Plan mode breaks down the implementation into manageable tasks:
- Task decomposition
- Dependency identification
- Timeline estimations
- Resource allocation

**Example Prompt:**
```
Using CursorRIPER Plan mode, break down the implementation of our user authentication system into specific tasks with dependencies and time estimates.
```

### 4. Code Generation (CursorRIPER Execute)

The Execute mode focuses on implementation:
- Writing code
- Integrating components
- Implementing features
- Resolving issues

**Example Prompt:**
```
Using CursorRIPER Execute mode, implement the login functionality for our user authentication system based on the design we've created.
```

### 5. Testing & Optimization (CursorRIPER Review)

The Review mode ensures quality:
- Code review
- Testing
- Performance optimization
- Security analysis

**Example Prompt:**
```
Using CursorRIPER Review mode, analyze our authentication implementation for potential security vulnerabilities and performance bottlenecks.
```

## Benefits of the Vibe Coding Workflow

- **Structured Approach**: Clear phases with defined responsibilities
- **Specialized Assistance**: AI personas optimized for each phase
- **Consistent Quality**: Standardized process across projects
- **Faster Delivery**: Reduced friction between phases
- **Comprehensive Documentation**: Documentation generated throughout the process

By following this workflow, you'll maximize the benefits of AI-assisted development while maintaining structure and quality control.
