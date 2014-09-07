# This script outputs the agent's version in the first lines, and the optional package's version in the second line.
# It can handle two formats of `git describe`:
#   vX.Y.Z-R : First line is X.Y.Z; second line is R
#   vX.Y.Z-R-COMMIT_HASH-1 : First line is X.Y.Z-COMMIT_HASH; no second line

# Back up the version string
h

# Remove the release component from COMMIT_HASH style versions
s/-[0-9]*//

s/^v//

# Noop t, used to make the second t command look at the next s/// expression only
t nop
: nop

# Remove the trailing number component in COMMIT_HASH styles
s/-[0-9]*//

# Print the agent version
p

# If we're COMMIT_HASH style, exit now
t

# Extract the release version component and print it as the second line
g
s/[^-]*-\([0-9]*\).*/\1/
p
