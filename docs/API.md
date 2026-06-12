# API Reference

## CLI Commands

### `sscs scan`

Scan a project for vulnerabilities in dependencies.

```bash
sscs scan [options]
```

**Options:**
- `-p, --path <path>` — Path to project directory (default: `.`)
- `-s, --severity <level>` — Minimum severity level to report (default: `medium`)
  - Values: `critical`, `high`, `medium`, `low`, `info`
- `--exclude-dev` — Exclude development dependencies from scan

**Examples:**
```bash
# Scan current directory
sscs scan

# Scan specific project with high severity only
sscs scan --path ./my-app --severity high

# Exclude dev dependencies
sscs scan --exclude-dev
```

---

### `sscs sbom`

Generate a Software Bill of Materials (SBOM).

```bash
sscs sbom [options]
```

**Options:**
- `-p, --path <path>` — Path to project directory (default: `.`)
- `-o, --output <file>` — Output file path (required)
- `-f, --format <format>` — SBOM format (default: `spdx`)
  - Values: `spdx`, `cyclonedx`

**Examples:**
```bash
# Generate SPDX SBOM
sscs sbom --output sbom.json

# Generate CycloneDX SBOM
sscs sbom --format cyclonedx --output sbom.xml

# SBOM for specific project
sscs sbom --path ./backend --output sbom.json
```

---

### `sscs license`

Check license compliance in project dependencies.

```bash
sscs license [options]
```

**Options:**
- `-p, --path <path>` — Path to project directory (default: `.`)
- `--strict` — Strict mode - fail on any license issues

**Examples:**
```bash
# Check licenses
sscs license

# Strict mode (exits with error if issues found)
sscs license --strict

# Check specific project
sscs license --path ./my-lib --strict
```

---

### `sscs report`

Generate a detailed security report.

```bash
sscs report [options]
```

**Options:**
- `-p, --path <path>` — Path to project directory (default: `.`)
- `-f, --format <format>` — Report format (default: `json`)
  - Values: `json`, `csv`, `html`
- `-o, --output <file>` — Output file path

**Examples:**
```bash
# Generate JSON report
sscs report --output report.json

# Generate HTML report
sscs report --format html --output report.html

# Generate CSV for spreadsheet
sscs report --format csv --output vulnerabilities.csv
```

---

## Configuration File

Create a `.sscsrc.json` in your project root for default settings:

```json
{
  "severity": "high",
  "licenseStrict": false,
  "excludeDevDependencies": false,
  "reports": {
    "formats": ["json", "html"],
    "outputDir": "./security-reports"
  }
}
```

---

## Exit Codes

- `0` — Scan completed successfully (no issues above threshold)
- `1` — Vulnerabilities or license issues found
- `2` — Configuration or runtime error

---

## Output Formats

### JSON Report Structure

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

---

## Programmatic Usage (TypeScript)

```typescript
import { scanProject, checkVulnerabilities, checkCompliance } from 'supply-chain-security-scanner';

// Scan for dependencies
const scanResult = await scanProject('./my-project');

// Check vulnerabilities
const vulnResults = await checkVulnerabilities(scanResult.dependencies);

// Check license compliance
const complianceResult = await checkCompliance(scanResult.dependencies);
```

---

## Environment Variables

- `SSCS_CVE_DB_PATH` — Custom path to CVE database
- `SSCS_CACHE_DIR` — Custom cache directory
- `SSCS_TIMEOUT` — Request timeout in milliseconds (default: 30000)
