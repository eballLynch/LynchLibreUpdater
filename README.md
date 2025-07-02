# Lynch LibreOffice Online Update XCD Replacement Script
This document provides instructions for using the autoUpdaterv2.bat batch script.

1. What This Script Does
This script automates the process of replacing the onlineupdate.xcd configuration file in your LibreOffice installation directory. This file is part of LibreOffice's internal registry and can be used to configure various settings, including update-related behaviors.

Specifically, this script will:

Identify its own location to find the onlineupdate.xcd file you wish to use.

Copy that onlineupdate.xcd file to the %PROGRAMFILES%\LibreOffice\share\registry directory, overwriting any existing file with the same name.

Perform checks to ensure the source file exists and that you are running the script with administrator privileges (which are required for this operation).

Provide feedback on whether the replacement was successful or if any errors occurred.

Keep the command prompt window open after execution until you press a key, allowing you to review the output.

2. Prerequisites
LibreOffice Installed: This script assumes LibreOffice is installed in its default location (%PROGRAMFILES%\LibreOffice). If your installation path is different, you will need to manually adjust the LIBREOFFICE_PATH_PART variable within the script.

Administrator Privileges: You must run this script as an Administrator. Without elevated privileges, Windows will prevent the script from writing to the %PROGRAMFILES% directory.

Source onlineupdate.xcd file: The onlineupdate.xcd file you want to copy must be located in the same directory as the batch script (replace_libreoffice_xcd.cmd).

3. How to Use
Save the Script:

Copy the content of the replace_libreoffice_xcd.cmd script (provided previously).

Paste it into a plain text editor (like Notepad).

Save the file with a .cmd or .bat extension (e.g., replace_libreoffice_xcd.cmd).

Place the onlineupdate.xcd File:

Ensure the onlineupdate.xcd file that you intend to use for replacement is placed in the exact same folder as the replace_libreoffice_xcd.cmd script.

Run as Administrator:

Navigate to the folder where you saved both the script and the onlineupdate.xcd file.

Right-click on replace_libreoffice_xcd.cmd.

Select "Run as administrator" from the context menu.

Review Output:

A command prompt window will open and display messages indicating the progress and outcome of the operation.

Read these messages carefully to ensure the script executed successfully.

The window will remain open until you press any key, allowing you to review all output.

4. Troubleshooting
"ERROR: This script must be run as an Administrator.":

Solution: Close the command prompt window. Right-click the batch file again and select "Run as administrator."

"ERROR: Source file not found!":

Solution: Make sure the onlineupdate.xcd file you want to copy is in the same directory as the replace_libreoffice_xcd.cmd script. Double-check the filename for typos.

"WARNING: LibreOffice registry path not found!":

Cause: This usually means LibreOffice is not installed in the default %PROGRAMFILES%\LibreOffice location, or the path configured in the script is incorrect.

Solution:

Verify the actual installation path of LibreOffice on your system (e.g., it might be in C:\Program Files (x86)\LibreOffice on a 64-bit system if you installed the 32-bit version, or a custom location).

Edit the replace_libreoffice_xcd.cmd script in a text editor.

Locate the line set "LIBREOFFICE_PATH_PART=\LibreOffice\share\registry" and modify it to reflect the correct path relative to your PROGRAMFILES or provide the full absolute path if needed (e.g., set "DEST_DIR=C:\Your\Custom\LibreOffice\Path\share\registry").

"ERROR: Failed to replace 'onlineupdate.xcd'.":

Cause: The file might be in use by LibreOffice or another process, or there might be a deeper permission issue.

Solution:

Ensure all LibreOffice applications (Writer, Calc, Impress, etc.) are completely closed before running the script.

Restart your computer and try running the script as Administrator again.

If the issue persists, manually navigate to %PROGRAMFILES%\LibreOffice\share\registry and try to delete or rename the onlineupdate.xcd file directly. If you can't, it indicates a system-level permission issue or file lock.
