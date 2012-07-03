require "guard"
require "guard/guard"
require "guard/treetop/version"

module Guard
  class Treetop < Guard
    DEFAULT_OPTIONS = {
      :all_on_start => false
    }

    def initialize(watchers=[], options={})
      watchers ||= []
      defaults = DEFAULT_OPTIONS.clone

      if options[:input]
        input = options.delete(:input)
        defaults.merge!({:output => input})
        watchers << ::Guard::Watcher.new(%r{#{input}/(.+)(\.treetop|\.tt)})
      end

      super(watchers, defaults.merge!(options))
    end
  end
end
