# How to Run the Backend Server

1. Open a terminal and navigate to the backend folder:
    ```bash
    cd /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend
    ```

2. Make sure you have Deno installed and your environment variables set in a `.env` file.

3. Run the backend server:
    ```bash
    deno run --allow-net --allow-env --env-file=.env index.ts
    ```

---

# How to Run Caddy (Reverse Proxy)

1. Make sure Caddy is installed (see above for installation options).

2. Use the provided Caddyfile for configuration. You can run Caddy with your custom config:
    ```bash
    caddy run --config /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend/Caddyfile
    ```

3. Or, to use Caddy as a background service (Homebrew):
    ```bash
    cp /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend/Caddyfile /opt/homebrew/etc/Caddyfile
    brew services restart caddy
    ```

This will set up Caddy as a reverse proxy for your backend endpoints.
# How to Run the Backend Server

1. Open a terminal and navigate to the backend folder:
    ```bash
    cd /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend
    ```

2. Make sure you have Deno installed and your environment variables set in a `.env` file.

3. Run the backend server:
    ```bash
    deno run --allow-net --allow-env --env-file=.env index.ts
    ```

If you see npm package errors, ensure you have a `deno.json` file in the backend folder (see above for setup).


# Installation Steps

> **Note:** These instructions are for macOS/Linux. For Windows, use the official documentation.

## Caddy Setup

1. **Install Caddy (macOS):**
        ```bash
        brew install caddy
        ```

        - By default, Caddy's data directory will be:
            `/opt/homebrew/var/lib`
            (see: https://caddyserver.com/docs/conventions#data-directory)

        - To start Caddy as a background service and restart at login:
            ```bash
            brew services start caddy
            ```

        - To run Caddy manually (not as a service):
            ```bash
            XDG_DATA_HOME="/opt/homebrew/var/lib" HOME="/opt/homebrew/var/lib" /opt/homebrew/opt/caddy/bin/caddy run --config /opt/homebrew/etc/Caddyfile
            ```
        - To run Caddy manually with your own Caddyfile:
            ```bash
            caddy run --config /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend/Caddyfile
            ```

        - To use your custom Caddyfile with the Homebrew service:
            ```bash
            cp /Users/MAHA/Desktop/GutzoMain/GutzoMain/backend/Caddyfile /opt/homebrew/etc/Caddyfile
            brew services restart caddy
            ```


        - Zsh completions are installed to:
            `/opt/homebrew/share/zsh/site-functions`

     Or, for Linux:
        ```bash
        curl -fsSL https://get.caddyserver.com | bash
        ```
     For Windows, download from [Caddy Downloads](https://caddyserver.com/download).

2. **Verify Caddy:**
    ```bash
    caddy version
    ```

3. **Start Caddy:**
    ```bash
    caddy start
    ```

---

## Deno Setup

1. **Install Deno (macOS/Linux):**
    ```bash
    curl -fsSL https://deno.land/install.sh | sh
    ```

    Or, using Homebrew (macOS):
    ```bash
    brew install deno
    ```

   For Windows, run in PowerShell:
    ```powershell
    iwr https://deno.land/install.ps1 -useb | iex
    ```

2. **Add Deno to PATH (macOS/Linux):**
    Add to your shell profile (`.bashrc`, `.zshrc`, etc.):
    ```bash
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
    ```
   For Windows, add `%USERPROFILE%\.deno\bin` to your system PATH.

3. **Verify Deno:**
    ```bash
    deno --version
    ```