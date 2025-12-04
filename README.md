# Doom Emacs Configuration

My personal [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration.

## About

This repository contains my Doom Emacs configuration files. Doom Emacs is a configuration framework for GNU Emacs that provides a curated set of packages and optimizations for a modern editing experience.

## Installation

### Prerequisites

- [Emacs](https://www.gnu.org/software/emacs/) 28.1 or newer
- [Git](https://git-scm.com/)
- [Doom Emacs](https://github.com/doomemacs/doomemacs) installed

### Setup

1. Backup your existing Doom configuration (if any):
   ```bash
   mv ~/.doom.d ~/.doom.d.backup
   ```

2. Clone this repository to your Doom configuration directory:
   ```bash
   git clone https://github.com/Eoin-McMahon/doom.git ~/.doom.d
   ```

3. Sync Doom Emacs to install/update packages:
   ```bash
   doom sync
   ```

4. Restart Emacs or reload the configuration:
   ```bash
   doom reload
   ```

## Configuration Files

- `init.el` - Doom modules configuration
- `config.el` - Personal configuration and customizations
- `packages.el` - Additional packages to install

## Updating

To update this configuration along with Doom Emacs:

```bash
cd ~/.doom.d
git pull
doom sync
```

## Resources

- [Doom Emacs Documentation](https://github.com/doomemacs/doomemacs/tree/master/docs)
- [Doom Emacs Discourse](https://discourse.doomemacs.org/)
- [GNU Emacs Manual](https://www.gnu.org/software/emacs/manual/)
