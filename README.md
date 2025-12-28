# 💣 ADB‑NETBREAKER

> **Break localhost. Expose ADB. Control the Android surface.**

---

## ⚠️ WARNING

This tool is **NOT for beginners**  
NOT for random usage  
and **NEVER for unauthorized targets**

If you don’t understand **ADB TCP exposure**,  
**STOP HERE.**

---

## 🧠 WHAT IS ADB‑NETBREAKER?

**ADB‑NETBREAKER** is an **offensive PowerShell tool** that exposes an
Android Emulator’s **ADB service (127.0.0.1:5555)** to the **network**.

By default, Android Emulator hides ADB behind localhost.  
This tool **breaks that boundary** and makes ADB reachable from:

- Kali Linux
- Another VM
- Another machine on the same network

---

## ☠️ WHY THIS TOOL?

Normally:
- ADB only listens on `127.0.0.1`
- Kali Linux cannot connect directly
- Manual setup is messy and error‑prone

**ADB‑NETBREAKER automates everything:**
- Enables ADB TCP mode
- Sets Windows port‑forwarding
- Adds Firewall rule
- Handles errors
- Gives clean attacker command

---

## ⚔️ REAL USE CASES

- Android App Pentesting
- Emulator‑based malware testing
- Red Team Android labs
- Drozer / Frida / Burp testing
- Network pivoting scenarios
- Android attack‑surface research

---

## 🧰 FEATURES

✔ Force ADB into TCP mode  
✔ Forward localhost → LAN  
✔ Auto Firewall allow rule  
✔ Error‑handled execution  
✔ Operator‑controlled inputs  
✔ Clean & repeatable  

---

## 🔥 HOW IT WORKS

<img width="319" height="321" alt="Screenshot 2025-12-28 203139" src="https://github.com/user-attachments/assets/d910eef2-0b0d-438e-8e8d-80ec7f06f6a1" />

---

## 🚀 USAGE

### 1️⃣ Run PowerShell as **Administrator**
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

##  2️⃣ Execute the Tool

yaml
Copy code
5555
💀 SUCCESS OUTPUT
sql
Copy code
[SUCCESS] ADB EXPOSED SUCCESSFULLY
Connect from Kali/Linux using:
adb connect 10.107.236.149:5555
