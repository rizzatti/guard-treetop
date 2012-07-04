require "spec_helper"

describe Guard::Treetop do
  describe "#initialize" do
    context "when no options are provided" do
      let(:guard) { Guard::Treetop.new }

      it "sets a default :all_on_start option" do
        guard.options[:all_on_start].should be_false
      end

      it "has no :input option" do
        guard.options[:input].should be_nil
      end

      it "has no :output option" do
        guard.options[:output].should be_nil
      end
    end

    context "with options provided" do
      let(:guard) { Guard::Treetop.new(nil, {:all_on_start => true}) }

      it "sets the provided :all_on_start option" do
        guard.options[:all_on_start].should be_true
      end
    end

    context "with :input provided" do
      let(:guard) { Guard::Treetop.new(nil, {:input => "lib"}) }

      it "removes the provided :input" do
        guard.options[:input].should be_nil
      end

      it "has one watcher" do
        guard.should have(1).watchers
      end

      it "watchers *.treetop and *.tt files" do
        guard.watchers.first.pattern.should == %r{lib/(.+)(\.treetop|\.tt)}
      end

      context "and no :output provided" do
        it "outputs to the same directory as input" do
          guard.options[:output].should == "lib"
        end
      end

      context "and :output is provided" do
        let(:options) do
          {:input => "lib/inputs", :output => "lib/outputs"}
        end
        let(:guard) { Guard::Treetop.new(nil, options) }

        it "respects the provided :output" do
          guard.options[:output].should == "lib/outputs"
        end
      end
    end
  end

  describe "running without output" do
    let(:guard) { Guard::Treetop.new(nil, :input => "inputs") }
    let(:inputs) { ["inputs/1.tt", "inputs/2.treetop"] }
    let(:outputs) { ["inputs/1.rb", "inputs/2.rb"] }
    before(:all) { Dir.stub(:glob).and_return(inputs) }

    it "should call run_on_changes" do
      guard.should_receive(:run_on_changes).with(inputs)
      guard.run_all
    end

    it "throws :task_has_failed on error" do
      expect { guard.run_on_changes(["/tmp/non_existent"]) }.to throw_symbol :task_has_failed
    end

    it "calls run_on_changes" do
      files = [inputs, outputs].transpose
      guard.compiler.should_receive(:compile).with(*files.first)
      guard.compiler.should_receive(:compile).with(*files.last)
      guard.run_on_changes(inputs)
    end
  end

  describe "running with output" do
    let(:guard) { Guard::Treetop.new(nil, :input => "inputs", :output => "outputs") }
    let(:inputs) { ["inputs/1.tt", "inputs/2.treetop"] }
    let(:outputs) { ["outputs/1.rb", "outputs/2.rb"] }
    before(:all) { Dir.stub(:glob).and_return(inputs) }

    it "calls run_on_changes" do
      files = [inputs, outputs].transpose
      guard.compiler.should_receive(:compile).with(*files.first)
      guard.compiler.should_receive(:compile).with(*files.last)
      guard.run_on_changes(inputs)
    end
  end
end
