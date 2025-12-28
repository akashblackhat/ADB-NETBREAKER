<img width="1536" height="1024" alt="ChatGPT Image Dec 28, 2025, 09_21_55 PM" src="https://github.com/user-attachments/assets/e7ce01f6-7674-47f7-a4ac-14763fbb9297" />


# ADB‑NETBREAKER
<img width="1250" height="863" alt="tools ss" src="https://github.com/user-attachments/assets/d1edc059-5261-4028-a916-76bdda47ee57" />


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
- Manual setup is messy and error-prone  

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
- Android attack-surface research  

---

## 🧰 FEATURES

✔ Force ADB into TCP mode  
✔ Forward localhost → LAN  
✔ Auto Firewall allow rule  
✔ Error-handled execution  
✔ Operator-controlled inputs  
✔ Clean & repeatable  

---

## 🔥 HOW IT WORKS

![Screenshot](https://github.com/user-attachments/assets/d910eef2-0b0d-438e-8e8d-80ec7f06f6a1)  

---

## 🚀 USAGE

### 1️⃣ Run PowerShell as **Administrator**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# 🚀 USAGE

## 1️⃣ Run PowerShell as **Administrator**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## 2️⃣ Execute the Tool

```powershell
.\adb_port_forward.ps1
```

## 3️⃣ Follow On‑Screen Prompts

📂 **Enter full path of `adb.exe`**  
📱 **Enter Android Emulator / Device name**  
🌐 **Enter Windows IP** (e.g., `192.168.*.***`)  
🔌 **Enter ADB port** (default `5555`)

---

# 💀 SUCCESS OUTPUT
<img width="1357" height="205" alt="linuxadb" src="https://github.com/user-attachments/assets/7a2b026d-f3f1-41f1-b2fb-9ad2d25f3e99" />


```text
[SUCCESS] ADB EXPOSED SUCCESSFULLY
Connect from Kali/Linux using:
adb connect 10.107.**.***:5555
```

---

# ⚠️ LEGAL DISCLAIMER

This tool is intended **ONLY** for:

- **Authorized testing**
- **Labs**
- **Research environments**

❌ Any misuse is **strictly illegal**  
❌ Developer is **NOT responsible** for abuse

---

# 🧑‍💻 CODED BY

**🔴 AKASH BLACK HAT**

---

# 📜 LICENSE

**Happy Hacking ( Privacy & Security No Such Things Exists in digital World, We Can Hack Everything )**




