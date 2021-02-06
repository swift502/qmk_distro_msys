; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "QMK MSYS"
#define MyAppDir "QMK_MSYS"
#define MyAppPublisher "QMK"
#define MyAppURL "https://qmk.fm"
#ifndef MyAppVersion
# define MyAppVersion "2.0.0"
#endif

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{52DB9201-A172-4A79-82C3-83B2E8B85FD8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\{#MyAppDir}
DisableProgramGroupPage=yes
UsePreviousAppDir=no
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=..\.build
OutputBaseFilename={#MyAppDir}
SetupIconFile=icon.ico
Compression=lzma2/max
SolidCompression=yes
UninstallDisplayIcon={app}\icon.ico
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: ".\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\drivers\*"; DestDir: {tmp}; Flags: deleteafterinstall
Source: "..\.build\msys64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Dirs]
Name:"{app}\"; Permissions:everyone-modify

[RUN]
Filename: "{tmp}\qmk_driver_installer.exe"; WorkingDir: "{tmp}"; Parameters: " --all --force drivers.txt"; StatusMsg: "Installing Drivers..."

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\usr\bin\mintty.exe"; Parameters: "-i ""{app}\icon.ico"" -T ""{#MyAppName}"" /usr/bin/bash -l -c ""MSYSTEM=MINGW64 exec -l bash"""; IconFilename: "{app}\icon.ico"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\usr\bin\mintty.exe"; Parameters: "-i ""{app}\icon.ico"" -T ""{#MyAppName}"" /usr/bin/bash -l -c ""MSYSTEM=MINGW64 exec -l bash"""; IconFilename: "{app}\icon.ico"; Tasks: desktopicon
