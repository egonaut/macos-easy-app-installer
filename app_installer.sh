# Opens Bash

#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
  # Install Homebrew
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo ""
else
  echo "Homebrew is already installed."
  echo ""
fi

# Check if lolcat is installed
if ! command -v lolcat &> /dev/null
then
  # Install lolcat using Homebrew
  echo "lolcat is not installed. Installing lolcat..."
  brew install lolcat
  echo ""
fi

# Check if neofetch is installed
if ! command -v neofetch &> /dev/null
then
  # Install neofetch using Homebrew
  echo "neofetch is not installed. Installing neofetch..."
  brew install neofetch
  echo ""
fi

# Function to install software using Homebrew
function install_software {
  # Install software
  for s in "${software[@]}"
  do
    name=$(echo "$s" | cut -d ' ' -f1)
    url=$(echo "$s" | cut -d ' ' -f2)
    brew install --cask "$name" --no-quarantine --force --appdir="/Applications" "$url"
  done
}

# Function to search Google for download link
# Function to search Google for download link
function search_google {
  # Search Google for download link
  query="$1"
  echo ""
  echo "Searching Google for download link..."
  echo ""
  results=$(curl -sL --compressed "https://www.google.com/search?q=${query// /+}+download+mac" | grep -oE "a href=\"https://[^\"]+\"" | grep -oE "https://[^\"]+" | head -5)
  idx=1
  for result in $results; do
    echo "Result $idx:"
    echo "Website: $(echo "$result" | cut -d '/' -f3)"
    echo "URL: $result"
    echo ""
    idx=$((idx+1))
  done

  read -p "Select the result number (1-5) or 'q' to quit: " selection

  if [[ $selection == "q" ]]; then
    echo "Search cancelled. Please try again."
    echo ""
    return
  elif [[ $selection -ge 1 && $selection -le 5 ]]; then
    selected_url=$(echo "$results" | sed -n "${selection}p")
    echo $selected_url
  else
    echo "Invalid selection. Please try again."
    echo ""
  fi
}

# Interactive menu with neofetch
neofetch | lolcat
echo "" | lolcat
echo "macOS Easy Application Installer" | lolcat
echo "" | lolcat
echo "1. Install default software" | lolcat
echo "2. Add software to installation" | lolcat
echo "3. Import software from file" | lolcat
echo "4. Search for software on Google" | lolcat
echo "5. Quit" | lolcat
echo "" | lolcat
read -p "Enter your choice: " choice
echo "" | lolcat

case "$choice" in
  1)
    # Install default software
    install_software | lolcat
    ;;
  2)
    # Add software to installation
    read -p "Enter the name of the software: " name
    read -p "Enter the URL for the software download: " url
    software+=("$name $url")
    echo "" | lolcat
    echo "The software has been added to the list." | lolcat
    echo "" | lolcat
    install_software | lolcat
    ;;
  3)
    # Import software from file
    read -p "Enter the path to the file: " file_path
    echo "" | lolcat
    echo "Importing software from file..." | lolcat
    echo "" | lolcat
    while read -r line
    do
      name=$(echo "$line" | cut -d ' ' -f1)
      url=$(echo "$line" | cut -d ' ' -f2)
      software+=("$name $url")
    done < "$file_path"
    install_software | lolcat
    ;;
  4)
    # Search for software on Google
    read -p "Enter the name of the software: " name
    echo "" | lolcat
    echo "Searching Google for download link..." | lolcat
    echo "" | lolcat
    url=$(search_google "$name")
    echo "" | lolcat
    read -p "Is this the correct download link? (y/n): " answer
    if [[ $answer == "y" ]]
    then
      software+=("$name $url")
      echo "" | lolcat
      echo "The software has been added to the list." | lolcat
      echo "" | lolcat
      install_software | lolcat
    else
      echo "" | lolcat
      echo "Please try again with a different search term." | lolcat
      echo "" | lolcat
    fi
    ;;
  5)
    # Quit
    exit | lolcat
    ;;
  *)
    # Invalid choice
    echo "Invalid choice. Please try again." | lolcat
    echo "" | lolcat
    ;;
esac
