use IO::Socket;
my $sock = new IO::Socket::INET (
	PeerAddr => '192.168.1.25',
	PeerPort => '7070',
	Proto => 'tcp',
	);
die "Could not create socket: $!\n" unless $sock;
print $sock "Hello there!\n";
print $sock `whoami\n`;
close($sock);


#---------------------------------------

# 90-Day Probation Period – COMS Change Management Cheatsheet

**Effective Date:** May 8, 2025
**Applies To:** All Production-affecting service requests (ECSO/COMS)
**Enforced By:** ECSO/VA Leadership

---

## 🔐 Scope

* Applies to **any change** involving the **Production environment**.
* Includes **any service request** resulting in a change.
* This process is **mandatory and not open for negotiation**.

---

## 📽 Recording Requirements

* **All changes must be recorded via Teams**.
* **Recordings** stored on **VA SharePoint**, accessible to IO leadership.

---

## 📅 Calendar Invite Requirements

* **Create a Teams meeting** for each change window.
* Must include:

  * COMS Leadership: Steve F, Paul B, Kevin M, David L, Chip F, Paul C
  * Engineers performing the change
  * Assigned VA FTE(s)
* Meeting invite must:

  * Match actual window date/time
  * Include completed, approved MOP as an attachment

---

## 📄 MOP Requirements

* Use official **COMS MOP Template** (found in Teams > Consolidated Video Location > Templates).
* **Must be:**

  * Fully filled out
  * Internally peer-reviewed
  * Approved by a **VA Government FTE**

---

## 👥 Required Participants in Change Window

* **Pilot Engineer** – leads execution of the change
* **Co-Pilot Engineer** – verifies steps, documents issues/outcomes
* **VA FTE** – must be present for all changes

---

## ✉️ Post-Change Requirements

* Send a **summary email** after every window:

  * Include **success/failure** status
  * Detail any notable issues, resolutions, or observations

---

## 📂 Where to Find Files & Templates

* **VAEC Probationary Change Requests** (Teams Channel)
* **COMS MOP Template:**

  * Channel: Consolidated Video Location → Files → Templates
* **Instructions for using Teams for this process:**

  * Channel: Consolidated Video Location → Files → Additional Documentation

---

## 🧭 Notes

* This 90-day probation may be extended.
* Probation period coincides with contract renewal window (91 days).
* May indicate **performance monitoring or political positioning**.

> **⚠️ Non-compliance = removal from the program.**

---

Stay compliant. Document everything. Protect your role.
