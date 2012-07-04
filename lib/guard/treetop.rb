require "guard"
require "guard/guard"
require "guard/treetop/version"
require "treetop"

module Guard
  class Treetop < Guard
    DEFAULT_OPTIONS = {
      :all_on_start => false
    }

    attr_reader :compiler

    def initialize(watchers=[], options={})
      watchers ||= []
      defaults = DEFAULT_OPTIONS.clone

      if options[:input]
        input = options.delete(:input)
        defaults.merge!({:output => input})
        watchers << ::Guard::Watcher.new(%r{#{input}/(.+)(\.treetop|\.tt)})
      end

      super(watchers, defaults.merge!(options))

      @compiler = ::Treetop::Compiler::GrammarCompiler.new
    end

    def run_all
      run_on_changes(Watcher.match_files(self, Dir.glob("**/*.{tt,treetop}")))
    end

    def run_on_changes(paths)
      tuples = paths.map { |e| [e, e.gsub(/(tt|treetop)\z/, 'rb')] }
      tuples.each { |e| compiler.compile(*e) }
    rescue RuntimeError
      throw :task_has_failed
    end
  end
end
