# Fish function to start ssh-agent and load a specific key
function loadkey
    # --- 1. Check for an argument ---
    if test -z "$argv[1]"
        echo "Usage: loadkey <key_name_prefix>"
        echo "Example: loadkey github"
        return 1
    end

    set KEY_NAME $argv[1]
    # Use simple string concatenation
    set KEY_PATH "$HOME/.ssh/"$KEY_NAME"_ed25519"

    # --- 2. Check if the key file exists ---
    if not test -f "$KEY_PATH"
        echo "Error: Key file not found at $KEY_PATH"
        return 1
    end

    # --- 3. Check agent and load key ---
    echo "Attempting to load key: $KEY_PATH"
    
    # Check if the agent socket is valid
    if test -S "$SSH_AUTH_SOCK"
        # Agent is running. Check if this specific key is already loaded.
        if ssh-add -l | grep -q "$KEY_PATH"
            echo "Agent is running and key '$KEY_NAME' is already loaded."
        else
            # Agent is running, but key is not loaded. Add it.
            echo "Agent running. Adding key..."
            ssh-add "$KEY_PATH"
        end
    else
        # Agent is not running. Start it and add the key.
        echo "Starting new ssh-agent and adding key..."
        eval (ssh-agent -c)
        ssh-add "$KEY_PATH"
    end
end
