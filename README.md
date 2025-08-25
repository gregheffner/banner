
![Banner](banner.png)
# Banner and Fetch Script

This repository contains the `banner-and-fetch.sh` script.

## Description


`banner-and-fetch.sh` is a shell script designed to display a banner and perform fetch operations. It uses the popular [`neofetch`](https://github.com/dylanaraps/neofetch) script to display system information alongside the custom banner. Please note: I did not create the `neofetch` script; it is an open-source tool used here to complement my own script.

## Usage

1. Open your terminal.
2. Navigate to the `banner` directory:
   ```sh
   cd /banner
   ```
3. Make the script executable (if not already):
   ```sh
   chmod +x banner-and-fetch.sh
   ```
4. Run the script:
   ```sh
   ./banner-and-fetch.sh
   ```



## Requirements

- macOS or Linux
- Bash or compatible shell
- figlet (for banner display)
- neofetch (for system information)


## Setup

To install required packages, run:

```sh
# macOS
brew install figlet neofetch

# Ubuntu/Debian
sudo apt-get update
sudo apt-get install figlet neofetch
```

## License

This project is licensed under the MIT License.
