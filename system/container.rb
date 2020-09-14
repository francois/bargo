# frozen_string_literal: true

require "dry/system/container"

class Application < Dry::System::Container
  use :env, inferrer: ->{ ENV.fetch("RACK_ENV", "development").to_sym }
  use :logging
  use :monitoring

  configure do |config|
    config.root = Pathname(".").realpath

    # we set "lib" relative to `root` as a path which contains class definitions
    # that can be auto-registered
    config.auto_register = "lib"
  end

  # this alters $LOAD_PATH hence the `!`
  load_paths!("lib")
end

Application.finalize!
