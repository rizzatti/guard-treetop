require 'guard'
require 'guard/guard'
require 'guard/treetop/version'
require 'treetop'

module Guard
  class Treetop < Guard
    include TreetopVersion

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

    def start
      run_all if options[:all_on_start]
    end

    def run_all
      run_on_changes(Watcher.match_files(self, Dir.glob('**/*.{tt,treetop}')))
    end

    def run_on_changes(paths)
      tuples = paths.map do |path|
        basename = File.basename(path).gsub(/\.(tt|treetop)\z/, '.rb')
        dirname = options[:output] || File.dirname(path)
        output = File.join(dirname, basename)
        [path, output]
      end
      tuples.each { |e| compiler.compile(*e) }
    rescue StandardError
      throw :task_has_failed
    end
  end
end
