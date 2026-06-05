; ============================================================
; PILAR ERP — NSIS Custom Installer Script
; PT. PILAR METALINDO BERKAT | OZTECH
;
; Handles:
;   1. Visual C++ 2022 Redistributable check & silent install
;   2. Post-install cleanup (remove bundled vc_redist.x64.exe)
;   3. Registry version branding
; ============================================================

; ── Detect VC++ 2022 x64 Runtime ─────────────────────────
!macro customInstall
  DetailPrint "$(^Name): Checking Visual C++ 2022 Runtime..."

  ; Check both HKLM paths (per-machine vs current user install)
  ReadRegDWORD $R0 HKLM "SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" "Installed"
  IntCmp $R0 1 VCAlreadyInstalled

  ReadRegDWORD $R0 HKLM "SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" "Installed"
  IntCmp $R0 1 VCAlreadyInstalled

  ; VC++ not found — install bundled redistribuable
  DetailPrint "$(^Name): Installing Visual C++ 2022 Redistributable x64..."
  IfFileExists "$INSTDIR\vc_redist.x64.exe" 0 VCSkip
    ExecWait '"$INSTDIR\vc_redist.x64.exe" /install /quiet /norestart' $R1
    IntCmp $R1 0 VCInstallOK
    IntCmp $R1 3010 VCInstallReboot  ; 3010 = success, reboot required
    DetailPrint "$(^Name): VC++ install exit code: $R1 (may already be up to date)"
    Goto VCCleanup

  VCInstallReboot:
    DetailPrint "$(^Name): Visual C++ 2022 installed. A restart may be required."
    Goto VCCleanup

  VCInstallOK:
    DetailPrint "$(^Name): Visual C++ 2022 Redistributable installed successfully."
    Goto VCCleanup

  VCSkip:
    DetailPrint "$(^Name): vc_redist.x64.exe not found in package — skipping."
    Goto VCDone

  VCAlreadyInstalled:
    DetailPrint "$(^Name): Visual C++ 2022 Runtime is already installed."
    Goto VCCleanup

  VCCleanup:
    ; Remove bundled redistributable from install directory
    Delete "$INSTDIR\vc_redist.x64.exe"

  VCDone:
    DetailPrint "$(^Name): Runtime check complete."

  ; Write publisher registry info
  WriteRegStr HKLM "Software\PT. PILAR METALINDO BERKAT\Pilar ERP" "Version" "1.0.0"
  WriteRegStr HKLM "Software\PT. PILAR METALINDO BERKAT\Pilar ERP" "Publisher" "PT. PILAR METALINDO BERKAT"
  WriteRegStr HKLM "Software\PT. PILAR METALINDO BERKAT\Pilar ERP" "Developer" "OZTECH"
  WriteRegStr HKLM "Software\PT. PILAR METALINDO BERKAT\Pilar ERP" "InstallPath" "$INSTDIR"
!macroend

; ── Uninstall cleanup ─────────────────────────────────────
!macro customUnInstall
  ; Remove registry entries
  DeleteRegKey HKLM "Software\PT. PILAR METALINDO BERKAT\Pilar ERP"

  ; Remove AppData (optional — comment out to preserve user data on uninstall)
  ; RMDir /r "$APPDATA\Pilar ERP"

  DetailPrint "$(^Name): Uninstall complete. User data preserved in $APPDATA\Pilar ERP"
!macroend
