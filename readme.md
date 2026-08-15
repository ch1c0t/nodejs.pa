# @ch1c0t/pa

A lightweight, expressive path resolution library built with `coffeelib` and `@ch1c0t/bow`. It simplifies working with standard base environment directories (such as XDG-like configurations) and safely resolves shortcut path symbols like `~` and `.`.

## Installation

```bash
npm install @ch1c0t/pa
```

## Features

- **XDG-Like Path Defaults**: Built-in static access to standard system storage paths (`home`, `.config`, `.local`, etc.).
- **Tilde (`~`) Resolution**: Automatically substitutes explicit `~` path prefixes with the active user's home directory path.
- **Relative Path Optimization**: Resolves basic relative symbols (like `.`) to absolute paths based on the current active working directory (`process.cwd()`).
- **Seamless String Coercion**: Returned instances safely override `toString()` to deliver plain absolute strings in string templates.

## Usage

### 1. Static System Paths
Access primary base directory chains without instantiating objects or running manual string concats:

```javascript
const { Pa } = require('@ch1c0t/pa');

console.log(Pa.home);   // Outputs: /home/username (or equivalent)
console.log(Pa.config); // Outputs: /home/username/.config
console.log(Pa.local);  // Outputs: /home/username/.local
console.log(Pa.share);  // Outputs: /home/username/.local/share
console.log(Pa.state);  // Outputs: /home/username/.local/state
```

### 2. Path Resolution Factory
Instantiate a wrapper to dynamically clean up, resolve, and normalize incoming string paths:

```javascript
// Resolving home directory shortcuts
const sharePath = Pa('~/.local/share');
console.log(`${sharePath}`); // Outputs absolute path: /home/username/.local/share

// Resolving local execution contexts
const specPath = Pa('spec');
console.log(specPath.toString()); // Outputs absolute path: /current/working/dir/spec
```

## Development

Get a local clone up and running for changes or debugging:

```bash
# Start a live development/watch session
npm start

# Execute the project test suites
npm test
```

## License

This project is licensed under the 0BSD License. See the `LICENSE` file for details.
