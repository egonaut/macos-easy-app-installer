
## macOS Easy Application Installer

This is a Bash script that simplifies the process of installing applications on macOS using Homebrew. The script offers an interactive menu, allowing users to choose from several options to manage their application installations.

### Features

1. Checks for and installs Homebrew if not already installed.
2. Checks for and installs `lolcat` and `neofetch` if not already installed.
3. Provides an interactive menu with five options:
   - Install default software
   - Add software to installation
   - Import software from file
   - Search for software on Google
   - Quit

### How it works

1. **Check and install Homebrew**: The script checks if Homebrew is installed on the system. If not, it downloads and installs Homebrew.

2. **Check and install lolcat and neofetch**: The script checks if `lolcat` and `neofetch` are installed. If not, it installs them using Homebrew. These tools are used to enhance the visual appearance of the script's output.

3. **Interactive menu**: The script displays an interactive menu, allowing the user to choose from various options to manage their software installations.

   - **Install default software**: This option installs a predefined set of applications using Homebrew. The list of default applications can be modified within the script.

   - **Add software to installation**: This option allows the user to add software to the installation list by entering the software name and download URL.

   - **Import software from file**: This option allows the user to import a list of software from a file. The file should contain one software entry per line, with the name and URL separated by a space.

   - **Search for software on Google**: This option searches Google for the specified software's download URL and displays the top 5 results. The user can select the desired result by entering the result number.

   - **Quit**: This option exits the script.

### Usage

To run the script, save it as a `.sh` file, open Terminal, navigate to the script's location, and execute it with the following command:

    bash appinstaller.sh


Follow the on-screen instructions to install and manage applications using the interactive menu.

