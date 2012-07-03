require "guard"
require "guard/guard"
require "guard/treetop/version"

module Guard
  class Treetop < Guard
    DEFAULT_OPTIONS = {
      :all_on_start => false
    }

    def initialize(watchers=[], options={})
      defaults = DEFAULT_OPTIONS.clone

      if options[:input]
        defaults.merge!({:output => options[:input]})
      end

      super(watchers, defaults.merge!(options))
    end
  end
end
