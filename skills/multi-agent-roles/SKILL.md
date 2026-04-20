---
name: multi-agent-roles
description: Professional AI role design framework for multi-agent systems.
description_zh: Professionl AI role design frmew或k 用于 多智能体 systems.。
---

# Multi-Agent Roles - Professional AI Role Design


## 中文说明

### 简介

multi-agent-roles - Professional AI role design framework for multi-agent systems.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/multi-agent-roles/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/multi-agent-roles
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

This skill provides a comprehensive framework for designing professional multi-agent systems. It includes standardized role definitions for various AI applications and workflows.

## Core Concept

A well-designed multi-agent system requires:

1. **Specialized Roles**: Agents with specific expertise
2. **Clear Boundaries**: Each role has well-defined responsibilities
3. **Efficient Communication**: Agents collaborate without overlap
4. **Scalability**: System can grow with additional roles

## Professional Role Definitions

### 1. Strategy & Analysis Roles

#### 1.1. Strategic Planner
- **Responsibilities**: 
  - Define long-term goals and objectives
  - Analyze market trends and opportunities
  - Develop strategic roadmaps
  - Make high-level decisions
- **Skills**: Strategic thinking, business acumen, data analysis
- **Use Cases**: Project planning, product strategy, business development

#### 1.2. Data Analyst
- **Responsibilities**:
  - Collect and analyze data
  - Identify patterns and trends
  - Generate insights and recommendations
  - Create reports and visualizations
- **Skills**: Data analysis, statistical modeling, visualization
- **Use Cases**: Business intelligence, performance tracking, market research

#### 1.3. Risk Manager
- **Responsibilities**:
  - Identify and assess potential risks
  - Develop risk mitigation strategies
  - Monitor risk factors
  - Implement contingency plans
- **Skills**: Risk assessment, scenario planning, compliance
- **Use Cases**: Project risk management, financial risk analysis

### 2. Creative & Design Roles

#### 2.1. Creative Director
- **Responsibilities**:
  - Lead creative processes
  - Define brand identity and guidelines
  - Review and approve creative work
  - Ensure consistency across projects
- **Skills**: Creative vision, design leadership, brand strategy
- **Use Cases**: Marketing campaigns, product design, content creation

#### 2.2. Content Strategist
- **Responsibilities**:
  - Develop content strategies
  - Plan content calendars
  - Ensure content quality and consistency
  - Analyze content performance
- **Skills**: Content planning, storytelling, SEO optimization
- **Use Cases**: Digital marketing, social media, content creation

#### 2.3. UX Designer
- **Responsibilities**:
  - Design user interfaces and experiences
  - Conduct user research
  - Create wireframes and prototypes
  - Test and optimize designs
- **Skills**: User-centric design, prototyping, usability testing
- **Use Cases**: Product design, software development, digital platforms

### 3. Technical & Development Roles

#### 3.1. Technical Architect
- **Responsibilities**:
  - Design system architecture
  - Make technical decisions
  - Ensure scalability and reliability
  - Oversee technical implementations
- **Skills**: System design, architecture patterns, technical leadership
- **Use Cases**: Software development, infrastructure design

#### 3.2. Full-Stack Developer
- **Responsibilities**:
  - Develop front-end and back-end systems
  - Write clean and maintainable code
  - Implement user interfaces
  - Test and debug applications
- **Skills**: Programming languages, web frameworks, database design
- **Use Cases**: Web development, application development

#### 3.3. QA Engineer
- **Responsibilities**:
  - Develop test plans and strategies
  - Write and execute tests
  - Identify and report bugs
  - Ensure product quality
- **Skills**: Testing methodologies, automation frameworks, debugging
- **Use Cases**: Software testing, quality assurance, release management

### 4. Operations & Management Roles

#### 4.1. Project Manager
- **Responsibilities**:
  - Plan and execute projects
  - Manage timelines and resources
  - Track progress and milestones
  - Coordinate team activities
- **Skills**: Project planning, resource management, communication
- **Use Cases**: Project management, team coordination

#### 4.2. Process Optimization Specialist
- **Responsibilities**:
  - Analyze existing processes
  - Identify improvement opportunities
  - Design optimized workflows
  - Implement process changes
- **Skills**: Process analysis, workflow design, continuous improvement
- **Use Cases**: Business process improvement, operational efficiency

#### 4.3. Customer Support Manager
- **Responsibilities**:
  - Manage customer support operations
  - Handle complex customer inquiries
  - Monitor support performance
  - Train support staff
- **Skills**: Customer service, conflict resolution, problem-solving
- **Use Cases**: Customer support, issue resolution

## Role Configuration Examples

### Example 1: Marketing Agency Multi-Agent System

```json
{
  "agents": {
    "list": [
      {
        "id": "marketing_strategist",
        "workspace": "/workspaces/marketing-agency/strategist",
        "agentDir": "/agents/marketing-strategist",
        "config": {
          "role": "Strategic Planner",
          "expertise": "marketing strategy, brand positioning",
          "responsibilities": [
            "Develop overall marketing strategy",
            "Define campaign objectives",
            "Allocate marketing budget"
          ]
        }
      },
      {
        "id": "content_creator",
        "workspace": "/workspaces/marketing-agency/content",
        "agentDir": "/agents/content-creator",
        "config": {
          "role": "Content Strategist",
          "expertise": "content planning, copywriting",
          "responsibilities": [
            "Create content calendars",
            "Write marketing copy",
            "Manage social media content"
          ]
        }
      },
      {
        "id": "graphic_designer",
        "workspace": "/workspaces/marketing-agency/design",
        "agentDir": "/agents/graphic-designer",
        "config": {
          "role": "Creative Director",
          "expertise": "visual design, branding",
          "responsibilities": [
            "Create visual assets",
            "Maintain brand consistency",
            "Design marketing materials"
          ]
        }
      },
      {
        "id": "analytics_specialist",
        "workspace": "/workspaces/marketing-agency/analytics",
        "agentDir": "/agents/analytics-specialist",
        "config": {
          "role": "Data Analyst",
          "expertise": "marketing analytics, performance tracking",
          "responsibilities": [
            "Track campaign performance",
            "Analyze user behavior",
            "Generate performance reports"
          ]
        }
      }
    ]
  },
  "bindings": [
    {
      "agentId": "marketing_strategist",
      "match": { "channel": "any", "peer": { "kind": "direct" } }
    },
    {
      "agentId": "content_creator",
      "match": { "channel": "any", "text": { "contains": ["content", "copy", "writing"] } }
    },
    {
      "agentId": "graphic_designer",
      "match": { "channel": "any", "text": { "contains": ["design", "visual", "logo"] } }
    },
    {
      "agentId": "analytics_specialist",
      "match": { "channel": "any", "text": { "contains": ["analytics", "report", "metrics"] } }
    }
  ]
}
```

### Example 2: Software Development Team

```json
{
  "agents": {
    "list": [
      {
        "id": "technical_architect",
        "workspace": "/workspaces/dev-team/architecture",
        "agentDir": "/agents/technical-architect",
        "config": {
          "role": "Technical Architect",
          "expertise": "system design, architecture patterns",
          "responsibilities": [
            "Design system architecture",
            "Make technical decisions",
            "Review code architecture"
          ]
        }
      },
      {
        "id": "frontend_developer",
        "workspace": "/workspaces/dev-team/frontend",
        "agentDir": "/agents/frontend-developer",
        "config": {
          "role": "Full-Stack Developer",
          "expertise": "React, JavaScript, UI design",
          "responsibilities": [
            "Develop user interfaces",
            "Implement frontend functionality",
            "Optimize performance"
          ]
        }
      },
      {
        "id": "backend_developer",
        "workspace": "/workspaces/dev-team/backend",
        "agentDir": "/agents/backend-developer",
        "config": {
          "role": "Full-Stack Developer",
          "expertise": "Node.js, Python, databases",
          "responsibilities": [
            "Develop APIs",
            "Design database schema",
            "Implement business logic"
          ]
        }
      },
      {
        "id": "qa_engineer",
        "workspace": "/workspaces/dev-team/qa",
        "agentDir": "/agents/qa-engineer",
        "config": {
          "role": "QA Engineer",
          "expertise": "testing, automation, debugging",
          "responsibilities": [
            "Write test cases",
            "Run test automation",
            "Identify and report bugs"
          ]
        }
      }
    ]
  },
  "bindings": [
    {
      "agentId": "technical_architect",
      "match": { "text": { "contains": ["architecture", "design", "technical"] } }
    },
    {
      "agentId": "frontend_developer",
      "match": { "text": { "contains": ["frontend", "UI", "React"] } }
    },
    {
      "agentId": "backend_developer",
      "match": { "text": { "contains": ["API", "database", "Node.js"] } }
    },
    {
      "agentId": "qa_engineer",
      "match": { "text": { "contains": ["test", "QA", "bug"] } }
    }
  ]
}
```

## Best Practices for Multi-Agent Role Design

### 1. Role Definition Principles

- **Single Responsibility**: Each role should have a clear, focused purpose
- **Complementary Skills**: Roles should complement each other's expertise
- **Clear Boundaries**: Define what each role is responsible for
- **Scalability**: Roles should support system growth

### 2. Communication Patterns

- **Hierarchical Communication**: Clear reporting lines
- **Peer-to-Peer Communication**: Direct collaboration between roles
- **Cross-Functional Communication**: Coordination across different teams
- **Formal Documentation**: Well-documented communication protocols

### 3. Performance Management

- **Role-Specific Metrics**: Define clear performance indicators
- **Continuous Feedback**: Regular performance reviews
- **Skill Development**: Support ongoing learning and improvement
- **Succession Planning**: Prepare for role transitions

## Role Assessment Framework

Use this framework to evaluate and refine your multi-agent roles:

### 1. Role Clarity
- Is the role's purpose clearly defined?
- Are responsibilities well-documented?
- Do team members understand their roles?

### 2. Role Fit
- Does the agent's expertise match the role requirements?
- Are skills and competencies aligned with responsibilities?
- Are there any skills gaps?

### 3. Role Effectiveness
- Is the role contributing to overall goals?
- Are performance metrics being met?
- Is there room for improvement?

### 4. Role Interdependencies
- How do roles interact with each other?
- Are communication channels effective?
- Are there any bottlenecks?

## Tools for Multi-Agent Role Management

### 1. Role Design Tools
- **Miro/FigJam**: Collaborative whiteboarding for role mapping
- **Lucidchart/Visio**: Diagramming role relationships
- **Jira/Asana**: Project management for role-based tasks

### 2. Role Assignment Tools
- **Talent Management Systems**: HR software for role assignment
- **AI Workflow Platforms**: OpenClaw, LangChain, AutoGen
- **Collaboration Tools**: Slack, Microsoft Teams, Discord

### 3. Performance Management Tools
- **OKR Platforms**: Objective-setting and tracking
- **Feedback Tools**: 360-degree feedback systems
- **Analytics Tools**: Performance reporting and analysis

## Future Trends in Multi-Agent Roles

### 1. AI-Driven Role Design
- Machine learning for role optimization
- Predictive role assignment
- Adaptive role capabilities

### 2. Hybrid Human-AI Roles
- Human-AI collaboration models
- Augmented human capabilities
- Cognitive automation

### 3. Dynamic Role Systems
- Flexible role definitions
- Role adaptation to changing needs
- Self-organizing multi-agent systems

## Conclusion

Professional multi-agent role design requires careful planning and continuous refinement. By defining clear roles with complementary skills and effective communication patterns, you can create robust, scalable multi-agent systems that drive innovation and efficiency.

The examples and frameworks provided here serve as a starting point for designing your own multi-agent systems. Remember to adapt these principles to your specific domain and requirements.

## Examples

```bash
# Example usage
skill --help
```


## Performance

### Optimization Tips

- Use caching where applicable to reduce repeated computations
- Consider batch processing for multiple operations
- Implement async/parallel processing when possible
- Monitor memory usage for large datasets

### Best Practices

- Profile before optimizing
- Use appropriate data structures for the task
- Consider lazy loading for large resources


## Dependencies

### Required

- Python 3.8+ or Node.js 16+ (depending on skill type)
- See skill metadata for specific requirements

### Optional

- Additional dependencies may be needed for extended features
- Check official documentation for full requirements


## API Reference

### Main Functions

```python
# Initialize
skill = Skill()

# Process data
result = skill.process(input_data)

# Cleanup
skill.close()
```

### Configuration

```python
# With options
config = {"option1": "value1", "option2": "value2"}
skill = Skill(config)
```


## Troubleshooting

### Common Issues

**Issue**: Command not found
- Solution: Ensure the skill is properly installed

**Issue**: Permission denied
- Solution: Check file permissions and user access

**Issue**: Configuration error
- Solution: Verify config.yaml syntax and paths

### Debug Mode

```bash
# Enable verbose output
skill run --verbose --debug

# Check logs
tail -f /var/log/skill.log
```


## Architecture

### Components

1. **Core Module** - Main processing logic
2. **CLI Interface** - Command-line interaction
3. **Configuration Manager** - Settings handling
4. **Logger** - Event tracking and debugging

### Data Flow

```
Input → Validator → Processor → Formatter → Output
```


## Features

### Core Features

- Feature 1: Description of what this capability does
- Feature 2: Another important capability
- Feature 3: Additional functionality

### Advanced Features

- Advanced option A for power users
- Advanced option B for customization


## Installation

```bash
pip install {skill_dir}
```

For development:

```bash
pip install -e .
```


## Use Cases

- Use Case 1: Common scenario description
- Use Case 2: Another typical usage pattern
- Use Case 3: Advanced or specialized usage


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies
