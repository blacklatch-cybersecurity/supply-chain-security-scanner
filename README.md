# Supply Chain Security Scanner 🔐

> **Automated security scanner for dependencies, vulnerabilities, and compliance in your software supply chain.**

A lightweight, open-source tool that scans dependencies, generates Software Bill of Materials (SBOM), detects vulnerable packages, and tracks license compliance in real time.

## 🎯 Why This Matters

Supply chain attacks are one of the top cybersecurity threats in 2026:
- **SolarWinds**, **Log4Shell**, **npm backdoors** — all supply chain exploits
- Organizations need instant visibility into their dependencies
- Current tools are expensive or closed-source

## ✨ Key Features

✅ **Real-time Dependency Scanning** — Detect vulnerable packages instantly  
✅ **SBOM Generation** — Export Software Bill of Materials (SPDX/CycloneDX format)  
✅ **CVE Correlation** — Automatically match packages against known vulnerabilities  
✅ **License Compliance** — Check licenses (MIT, Apache, GPL, BSD, etc.)  
✅ **Multi-Language Support** — Node.js, Python, Go, Rust, Java (extensible)  
✅ **CI/CD Integration** — Built-in GitHub Actions, GitLab CI, Jenkins support  
✅ **Risk Scoring** — Severity-based vulnerability prioritization  
✅ **Compliance Reports** — SOC 2, ISO 27001 ready reports  
✅ **JSON/CSV Export** — Easy integration with other tools  
✅ **Local Analysis** — Runs entirely on your machine (no cloud upload)  

## 🚀 Quick Start

### Installation

```bash
# Install from npm (coming soon)
npm install -g supply-chain-security-scanner

# Or use Docker
docker pull blacklatch/supply-chain-scanner
```

### Basic Usage

```bash
# Scan current directory
sscs scan

# Scan specific project
sscs scan --path ./my-project

# Generate SBOM
sscs sbom --output sbom.json

# Check license compliance
sscs license --strict

# Export report
sscs report --format json --output report.json
```

### Docker Usage

```bash
docker run -v $(pwd):/workspace blacklatch/supply-chain-scanner scan --path /workspace
```

## 📊 Example Output

```json
{
  "scan_id": "scan_12345",
  "timestamp": "2026-06-12T10:30:00Z",
  "project": "my-app",
  "language": "nodejs",
  "summary": {
    "total_dependencies": 245,
    "critical_vulnerabilities": 3,
    "high_vulnerabilities": 12,
    "license_issues": 2
  },
  "vulnerabilities": [
    {
      "package": "lodash",
      "version": "4.17.19",
      "severity": "HIGH",
      "cve": "CVE-2021-23337",
      "description": "Lodash versions before 4.17.21 are vulnerable to Prototype Pollution",
      "remediation": "Update to lodash@>=4.17.21"
    }
  ],
  "licenses": [
    {
      "package": "viral-lib",
      "license": "GPL-3.0",
      "status": "RESTRICTED",
      "reason": "GPL license in production code"
    }
  ]
}
```

## 🏗️ Project Structure

```
supply-chain-security-scanner/
├── README.md                 # This file
├── LICENSE                   # Apache 2.0
├── package.json              # Node.js metadata
├── tsconfig.json             # TypeScript config
├── jest.config.js            # Test configuration
├── .eslintrc.json            # Linting rules
├── .prettierrc.json          # Code formatting
├── docker-compose.yml        # Local development setup
├── Dockerfile                # Container setup
├── docs/
│   ├── INSTALLATION.md       # Detailed setup guide
│   ├── API.md                # CLI & API reference
│   ├── ARCHITECTURE.md       # How it works
│   └── CONTRIBUTING.md       # Developer guide
├── src/
│   ├── index.ts              # Main entry point
│   ├── cli/                  # Command-line interface
│   ├── scanner/              # Core scanning logic
│   │   ├── index.ts
│   │   ├── nodejs.ts         # npm/yarn scanner
│   │   ├── python.ts         # pip scanner
│   │   ├── go.ts             # go.mod scanner
│   │   └── rust.ts           # Cargo.lock scanner
│   ├── sbom/                 # SBOM generation
│   │   ├── index.ts
│   │   ├── spdx.ts           # SPDX format
│   │   └── cyclonedx.ts      # CycloneDX format
│   ├── vulnerability/        # CVE detection
│   │   ├── index.ts
│   │   ├── cvedb.ts          # CVE database integration
│   │   └── matcher.ts        # Vulnerability matching
│   ├── compliance/           # License checking
│   │   ├── index.ts
│   │   ├── licenses.ts       # License database
│   │   └── validator.ts      # License validation
│   └── report/               # Report generation
│       ├── index.ts
│       ├── json.ts
│       ├── csv.ts
│       └── html.ts
├── tests/
│   ├── unit/                 # Unit tests
│   ├── integration/          # Integration tests
│   └── fixtures/             # Test data
├── examples/
│   ├── package.json          # Example Node.js project
│   ├── requirements.txt      # Example Python project
│   └── go.mod                # Example Go project
├── .github/
│   ├── workflows/
│   │   ├── ci.yml            # CI/CD pipeline
│   │   └── release.yml       # Release automation
│   └── ISSUE_TEMPLATE/
└── .gitignore                # Git exclusions
```

## 🔧 Technology Stack

- **Language:** TypeScript/Node.js
- **CLI:** Commander.js, Chalk
- **Parsing:** Various language-specific parsers
- **Scanning:** Trivy API, NVD database, OSV database
- **Testing:** Jest, Mocha
- **Containerization:** Docker, Docker Compose

## 📖 Documentation

- [Installation Guide](./docs/INSTALLATION.md)
- [API Reference](./docs/API.md)
- [Architecture](./docs/ARCHITECTURE.md)
- [Contributing](./docs/CONTRIBUTING.md)

## 🛣️ Roadmap

### Phase 1 (MVP - 8 weeks)
- [x] Project initialization
- [ ] Node.js dependency scanning
- [ ] Basic CVE detection
- [ ] SBOM generation (SPDX)
- [ ] License compliance check
- [ ] JSON report export

### Phase 2 (Extended Support - 12 weeks)
- [ ] Python/pip support
- [ ] Go/mod support
- [ ] Rust/cargo support
- [ ] CycloneDX SBOM format
- [ ] CSV export
- [ ] Docker image release

### Phase 3 (Enterprise - 16 weeks)
- [ ] REST API
- [ ] Web dashboard
- [ ] Database persistence
- [ ] Webhook integration
- [ ] CI/CD plugins (GitHub Actions, GitLab CI, Jenkins)
- [ ] Advanced reporting

## 💻 Development Setup

```bash
# Clone repository
git clone https://github.com/blacklatch-cybersecurity/supply-chain-security-scanner
cd supply-chain-security-scanner

# Install dependencies
npm install

# Run tests
npm test

# Run in development
npm run dev

# Build for production
npm run build
```

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for:
- Development workflow
- Code style guide
- Testing requirements
- Pull request process

## 📝 License

Apache License 2.0 — See [LICENSE](./LICENSE) file

## 🔒 Security

This tool helps secure your supply chain. If you find a vulnerability in this project itself, please report it responsibly via security@blacklatch.dev

## 📞 Support

- 📖 [Documentation](./docs/)
- 🐛 [Issue Tracker](https://github.com/blacklatch-cybersecurity/supply-chain-security-scanner/issues)
- 💬 [Discussions](https://github.com/blacklatch-cybersecurity/supply-chain-security-scanner/discussions)

## 🌟 Inspiration

Built for organizations that need:
- Instant supply chain visibility
- SOC 2/ISO 27001 compliance
- Integration into existing DevSecOps pipelines
- Open-source, auditable security scanning

---

**Made by the Blacklatch Cybersecurity Team** 🛡️
