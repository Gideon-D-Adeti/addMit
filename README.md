# addMit

`addMit` is a bash script that stages changes and commits them to a git repository. It provides flexible options to add and commit changes either with a message provided via the command line or by opening a text editor for the commit message.

## Installation

### Prerequisites
- Git (install from [git-scm.com](https://git-scm.com/))
- Bash (usually pre-installed on Unix-like systems)

### Clone the Repository
```bash
git clone https://github.com/Gideon-D-Adeti/addMit.git
```
Or if you have [cloneO](https://github.com/Gideon-D-Adeti/cloneO) setup:
```bash
cloneO https://github.com/Gideon-D-Adeti/addMit.git
```
[cloneO](https://github.com/Gideon-D-Adeti/cloneO) allows you to clone and open a repo in Visual Studio Code.

### Make the script available system-wide
```bash
sudo cp addMit/addMit.sh /usr/local/bin/addMit
sudo chmod +x /usr/local/bin/addMit
```
Or if you used cloneO:
```bash
sudo cp addMit.sh /usr/local/bin/addMit
sudo chmod +x /usr/local/bin/addMit
```

### Recommendation
If you're using Visual Studio Code, set it as your default message editor.

To do this, type (or copy & paste) this command into your terminal and hit `Enter`.
```bash
git config --global core.editor "code --wait"
```
There will be no confirmation or any output on the terminal after entering this command.


## Usage
1. To stage all changes and open a text editor to enter the commit message:
   ```bash
   addMit
   ```
2. To stage all changes and commit with the provided message:
   ```bash
   addMit -m "Your commit message here"
   ```
3. To stage specific file(s) and open a text editor to enter the commit message:
   ```bash
   addMit <file1> [<file2> ...]
   ```
4. To stage specific file(s) and commit with the provided message:
   ```bash
   addMit <file1> [<file2> ...] -m "Your commit message here"
   ```

### Examples
1. ```bash
    addMit
    ```
2. ```bash
    addMit -m "Fix typo in documentation"
    ```
1. ```bash
    addMit index.html
    ```
2. ```bash
    addMit style.css script.js -m "feat: Implement login functionality"
    ```

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.
