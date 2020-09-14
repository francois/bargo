# frozen_string_literal: true

Application.boot(:persistence) do |container|
  start do
    require "sequel"
    register("persistence.db", Sequel.connect(ENV.fetch("DATABASE_URL"), logger: container[:logger]))

    require "redis"
    register("persistence.redis", Redis.new(url: ENV.fetch("REDIS_URL"), logger: container[:logger]))
  end
end
