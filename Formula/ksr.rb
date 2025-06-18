# This formula is an alias for ksr-cli
# Users can install using either:
#   brew install aywengo/tap/ksr-cli
#   brew install aywengo/tap/ksr

require_relative "ksr-cli"

class Ksr < KsrCli
  # Inherit everything from KsrCli
  # This creates an alias formula that installs the same package
end
