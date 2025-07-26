## 🚀 Building a Bootable "Hello World" OS in Assembly

> "Most people write *Hello World* in C. I wrote mine in Assembly… and booted it."

> Yes. It's simple. But it's *booted with love*. ❤️

---

### 🧠 What Is It?

A tiny, minimal operating system that boots directly from a `.img` file, shows a "Hello, World!" message using BIOS interrupts, and displays a cute signature line — all in **16-bit real mode Assembly**.

---

### 🔧 Tools Used:

* **NASM** – The Netwide Assembler (to write and compile x86 Assembly code)
* **QEMU** – Emulator to run and test your bootable image
* **BIOS Interrupts** – Like `int 0x10` for controlling screen output
* **Hex and Boot Signatures** – `0x7C00` offset and `0xAA55` at the end for boot sector

---

### 🛠 How It Works:

1. **Assembly Language** – This OS is written in pure 16-bit x86 Assembly (real mode).
2. **BIOS Boot** – When you boot from the image, BIOS loads the first 512 bytes (the boot sector) from the drive into memory at `0x7C00`.
3. **Video Interrupts** – We use `int 0x10` (BIOS video service) to print text to the screen.
4. **No OS dependencies** – It’s raw metal. Your code runs directly on the hardware.
5. **Boot Signature** – The last two bytes are `0xAA55`, which tells the BIOS it's a valid boot sector.

---

### 🌈 Features:

* 🖥️ Bootable image (`.img`) that runs on any x86 machine/emulator.
* ✍️ Prints "Hello, World!" and a custom line: **"Booted with love ;)"**
* ⚙️ Works both on 32-bit and 64-bit emulators
* 📜 Pure assembly, no C, no OS, no clutter — minimalism at its best
* 👨‍💻 A beginner-friendly intro to low-level system programming

---

### ▶️ How to Run:

#### 1. **Clone the Repo:**

```bash
git clone https://github.com/Sreeju7733/helloworld-os.git
cd helloworld-os
```

#### 2. **Assemble the Boot Sector:**

```bash
nasm -f bin main.asm -o helloworld.img
```

#### 3. **Run with QEMU:**

```bash
qemu-system-x86_64 -drive format=raw,file=helloworld.img
```

🪄 And boom! You’ll see "Hello, World!" + your lovely message.

> P.S. Even though it’s small, it’s technically a real operating system. 😉
