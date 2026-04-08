# yt-dlp Development Environment

This project provides a reproducible and isolated development environment for using [yt-dlp](https://github.com/yt-dlp/yt-dlp) with all its necessary dependencies, powered by [Nix](https://nixos.org/), [uv](https://docs.astral.sh/uv/), and [direnv](https://direnv.net/).

## Features
- **Isolated Python Environment**: Managed by `uv` for lightning-fast dependency resolution.
- **Pre-configured `yt-dlp`**: Includes a `yt-dlp.conf` optimized for typical use cases.
- **Batteries Included**: Automatically installs `ffmpeg` (for media processing) and `bun` (for JS evaluation required by YouTube and other extractors).

## Prerequisites

To get started, you will need to install:
1. [Nix](https://nixos.org/download) (Package manager)
2. *Optional but recommended:* [direnv](https://direnv.net/) (for automatic environment activation)

## Enabling the Development Environment

There are two ways to activate the environment:

### Method 1: Using `direnv` (Recommended)
If you have `direnv` installed and hooked into your shell, simply navigate to the project directory and run:

```bash
direnv allow
```

This will automatically load the Nix flake, sync Python dependencies using `uv`, and activate the virtual environment whenever you enter the directory.

### Method 2: Using Nix Directly
If you prefer not to use `direnv`, you can manually enter the development shell using Nix:

```bash
nix develop
```

This drops you into a shell with `yt-dlp`, `ffmpeg`, and `bun` ready to use. The virtual environment will be automatically activated.

## Using `yt-dlp`

Once the environment is active, you can use `yt-dlp` directly from the command line.

The project includes a `yt-dlp.conf` file with the following default behaviors:
- Automatically saves downloaded media into the `output/` directory with the format `[Title].[Extension]`.
- Uses `bun` as the JavaScript runtime for faster extraction.
- Automatically extracts cookies from your local Google Chrome installation (useful if you get 429 errors).

### Example Usage

To download a video, pass the URL:

```bash
yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```

You can check the `yt-dlp.conf` file to see all the active configurations or add your own flags. For more advanced usage, refer to the [official yt-dlp documentation](https://github.com/yt-dlp/yt-dlp).
