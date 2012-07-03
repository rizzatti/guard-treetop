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
end
