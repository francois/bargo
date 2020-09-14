# frozen_string_literal: true

require "dry/system/container"

class Application < Dry::System::Container
  configure do |config|
    # Fails with TypeError
    config.root = Pathname(".")

    # Succeeds
    # config.root = Pathname(".").realpath.to_s

    # we set "lib" relative to `root` as a path which contains class definitions
    # that can be auto-registered
    config.auto_register = "lib"
  end

  # this alters $LOAD_PATH hence the `!`
  load_paths!("lib")
end
