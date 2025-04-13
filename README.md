# 🎮 DXVK Vulkan Wrapper Automator for DMC4 SE (or Any D3D Game)

This is a simple **batch script** that automates the process of wrapping any **Direct3D 10/11** game with **DXVK**, allowing it to run using the Vulkan backend. It’s particularly useful for fixing GPU-related crashes like:

> `DXGI_ERROR_DEVICE_REMOVED: mpstagingbuffer -> map (D3D10_MAP_READ_WRITE...)`

🛠️ **Tested on:**
- Devil May Cry 4 Special Edition (DODI Repack)
- Windows 11 with RTX 2050
- NVIDIA and AMD GPUs

---

## 💡 What It Does

- Prompts for your game installation directory
- Extracts DXVK from archive
- Copies `d3d11.dll` and `dxgi.dll` to the game folder
- (Optional) Creates a `dxvk.conf` file for HUD/logging
- Lets you run older D3D games on modern Vulkan-based GPUs more stably

---

## 📦 Prerequisites

- [DXVK Release `.tar.gz`](https://github.com/doitsujin/dxvk/releases) — place in the same folder as the script (e.g., `dxvk-2.3.tar.gz`)
- [7-Zip CLI](https://www.7-zip.org/) — must be installed or bundled (`7z.exe`)
- Windows 10 or 11

---

## 🚀 How to Use

1. **Download the script** (`dxvk_wrap.bat`) and the latest DXVK release.
2. **Place `dxvk-<version>.tar.gz` in the same folder** as the script.
3. **Run the script** by double-clicking `dxvk_wrap.bat`
4. **Enter the path** to your game folder (where `DMC4SE.exe` is located)
5. Done! Launch the game and enjoy Vulkan stability!

---

## 🧰 Example Output

```
=== DXVK Vulkan Wrapper ===
Enter the full path to the game folder (e.g. D:\Games\DMC4SE): D:\Games\DMC4SE
Extracting DXVK...
Copying d3d11.dll and dxgi.dll to: D:\Games\DMC4SE
Creating dxvk.conf...
✅ DXVK Vulkan wrapper installed successfully!
You can now launch the game using Vulkan.
```

---

## 📝 Notes

- The script currently assumes you already have `dxvk-<version>.tar.gz` in the same directory.
- Auto-download from GitHub may be added in future versions.
- Compatible with both **NVIDIA** and **AMD** GPUs.
- Use this for other D3D10/11 games that crash or fail on modern systems!

---

## 📃 License

MIT License. Free to use and modify.

---

## ❤️ Credits

- [DXVK by doitsujin](https://github.com/doitsujin/dxvk)
- Script by dragonpilee
