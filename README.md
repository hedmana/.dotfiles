# NixOS config

## Setup nix-shell environments

**Python venv**

```python
with import <nixpkgs> {};

mkShell {
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc
    zlib
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  buildInputs = [ python311 ];
  
  shellHook = ''
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH

    # Create virtual environment if it doesn't exist
    if [ ! -d .venv ]; then
      ${python311}/bin/python -m venv .venv
    fi
    
    # Activate the virtual environment
    source .venv/bin/activate
    
    # Optional: Upgrade pip to latest version
    pip install --upgrade pip
  '';
}

```

