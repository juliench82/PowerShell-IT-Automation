# PowerShell IT Automation Suite 🚀

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207.x-blue.svg)](https://docs.microsoft.com/powershell/)
[![Windows](https://img.shields.io/badge/Platform-Windows%20Server-lightgrey.svg)](#)
[![Enterprise](https://img.shields.io/badge/Category-Enterprise%20IT-orange.svg)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Professional PowerShell automation scripts for enterprise IT infrastructure management**

A comprehensive collection of **production-ready PowerShell scripts** designed for **IT Managers**, **System Administrators**, and **DevOps Engineers** to automate critical infrastructure tasks, user management, and system operations at enterprise scale.

---

## ⚡ How to review in 2 minutes
1) Onboarding demo
```
cd AD-UserManagement
pwsh ./New-EmployeeSetup.ps1 -UserData ./sample_employees.csv -Template StandardUser
```
2) Infra health report
```
pwsh ./System-Monitoring/Get-InfrastructureReport.ps1 -ReportPath ./infra_report.html
```
3) Compliance snapshot
```
pwsh ./Security-Automation/Invoke-ComplianceAudit.ps1 -Standard ISO27001 -Export ./compliance.html
```

---

## 🎯 Business Value & ROI
- **Time Savings**: Reduce manual tasks by 70-80%
- **Error Reduction**: Eliminate human error in routine operations
- **Compliance**: Automated audit trails and policy enforcement
- **Scalability**: Manage thousands of systems with consistent procedures
- **Cost Efficiency**: Lower operational overhead and faster deployment
- **Security**: Standardized security configurations and monitoring

## 📁 Script Categories

### 💻 Active Directory Management
```powershell
📂 AD-UserManagement/
├── 📄 New-EmployeeSetup.ps1           # Bulk user creation from CSV
├── 📄 sample_employees.csv            # Example input
```

### ☁️ Office 365 & Azure Management
```powershell
📂 O365-Administration/
└── 📄 License-Management.ps1          # License assignment (placeholder)
```

### 📊 System Monitoring & Health
```powershell
📂 System-Monitoring/
├── 📄 Get-InfrastructureReport.ps1    # HTML infra health report
└── 📄 .. uses ./servers.txt           # Targets list
```

### 🛡️ Security & Compliance
```powershell
📂 Security-Automation/
└── 📄 Invoke-ComplianceAudit.ps1      # ISO27001/GDPR baseline checks
```

## 📋 Prerequisites & Setup
```powershell
Install-Module ActiveDirectory, PSWindowsUpdate -Scope CurrentUser -Force
```

## 👤 Author
**Julien Chevallier** — Senior IT Manager

---

⭐ If this helped, consider starring the repo.
