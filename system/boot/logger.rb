# frozen_string_literal: true

Application.boot(:logger) do
  init do
    require "logger"
  end

  start do
    logger = ::Logger.new(STDERR)
    logger.formatter = ->(severity, timestamp, _appname, msg) do
      "%19.19s.%s [%s] %-5.5s - %s\n" % [timestamp.iso8601, timestamp.nsec.to_s[0, 3], Thread.current.object_id.to_s[-5..-1], severity, msg]
    end

    register(:logger, logger)
  end
end
