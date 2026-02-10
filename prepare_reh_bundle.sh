#!/usr/bin/env bash
# Prepare a REH/REH-Web bundle for embedding inside Partitura.app.
# Called from within the vscode-reh(-web)-{platform}-{arch} directory.
#
# 1. Strips non-code media files that cause macOS codesign warnings
#    (Contents/MacOS/ treats everything as code objects)
# 2. Removes metadata dirs (.github) that confuse codesign
# 3. Ad-hoc signs native binaries (node, *.node) so the bundle
#    passes codesign --verify without warnings

set -e

echo "  Preparing REH bundle for Partitura embedding..."

# --- Strip non-code files that cause codesign "not signed at all" warnings ---
MEDIA_COUNT=0
while IFS= read -r -d '' file; do
  rm -f "$file"
  MEDIA_COUNT=$((MEDIA_COUNT + 1))
done < <(find . -type f \( -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.mp4" -o -name "*.webm" \) -print0)

if [[ $MEDIA_COUNT -gt 0 ]]; then
  echo "  Stripped $MEDIA_COUNT media files"
fi

# Remove empty directories left after stripping
find . -type d -empty -delete 2>/dev/null || true

# Remove .github directories
find . -type d -name ".github" -exec rm -rf {} + 2>/dev/null || true

# --- Ad-hoc sign native binaries (macOS only) ---
if [[ "${OS_NAME}" == "osx" ]]; then
  SIGNED_COUNT=0

  # Sign the node binary
  if [[ -f "./node" ]]; then
    codesign --force --sign - "./node" 2>/dev/null && SIGNED_COUNT=$((SIGNED_COUNT + 1))
  fi

  # Sign all native .node modules
  while IFS= read -r -d '' file; do
    codesign --force --sign - "$file" 2>/dev/null && SIGNED_COUNT=$((SIGNED_COUNT + 1))
  done < <(find . -type f -name "*.node" -print0)

  # Sign the server binary
  if [[ -f "./bin/partitura-server" ]]; then
    codesign --force --sign - "./bin/partitura-server" 2>/dev/null && SIGNED_COUNT=$((SIGNED_COUNT + 1))
  fi

  echo "  Ad-hoc signed $SIGNED_COUNT native binaries"
fi

echo "  REH bundle ready"
