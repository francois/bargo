# frozen_string_literal: true

Application.boot(:logger) do
  init do
    require "logger"
  end

  start do
    logger = ::Logger.new(STDERR)
    logger.formatter = ->(timestamp, severity, appname, msg) do
      "[%-8.8s] [%6d] %-6.6s - %s\n" % [appname, Thread.current.object_id, severity, msg]
    end

    register(:logger, logger)
  end
end
