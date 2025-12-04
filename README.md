# Doom Emacs Configuration

This repository contains my personal [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration.

## About Doom Emacs

Doom Emacs is a configuration framework for GNU Emacs tailored for Emacs bankruptcy veterans who want less framework in their frameworks and the performance of a hand-rolled config.

## Installation

### Prerequisites

- Emacs 27.1 or higher (28.1+ recommended)
- Git 2.23+
- [Doom Emacs](https://github.com/doomemacs/doomemacs) installed

### Setup

1. **Install Doom Emacs** (if not already installed):
   ```bash
   git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
   ~/.config/emacs/bin/doom install
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/Eoin-McMahon/doom ~/.config/doom
   ```

3. **Sync your configuration**:
   ```bash
   ~/.config/emacs/bin/doom sync
   ```

4. **Restart Emacs**

## Configuration Files

Doom Emacs configuration consists of three main files:

- **`init.el`**: Module configuration - enables/disables Doom modules
- **`config.el`**: Personal configuration - your custom settings and keybindings
- **`packages.el`**: Package management - additional packages to install

## Updating

To update Doom Emacs and sync your configuration:

```bash
~/.config/emacs/bin/doom upgrade
~/.config/emacs/bin/doom sync
```

## Useful Commands

- `doom sync` - Synchronize your config with Doom Emacs
- `doom upgrade` - Update Doom Emacs to the latest version
- `doom doctor` - Diagnose common issues with your setup
- `doom env` - Regenerate your shell environment file
- `doom build` - Recompile all installed packages

## Customization

Feel free to fork this repository and customize it to your needs. Refer to the [Doom Emacs documentation](https://docs.doomemacs.org) for more information on customization.

## Resources

- [Doom Emacs Documentation](https://docs.doomemacs.org)
- [Doom Emacs GitHub](https://github.com/doomemacs/doomemacs)
- [Doom Emacs Discourse](https://discourse.doomemacs.org)

## License

This configuration is provided as-is for personal use.
