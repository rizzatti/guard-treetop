require 'spec_helper'
require 'guard/treetop'

module Guard
  describe Treetop do
    describe 'the class' do
      it 'has a version number' do
        subject.class::VERSION.should == TreetopVersion::VERSION
      end
    end

    describe '#initialize' do
      context 'when no options are provided' do
        it 'sets a default :all_on_start option' do
          subject.options[:all_on_start].should be_false
        end

        it 'has no :input option' do
          subject.options[:input].should be_nil
        end

        it 'has no :output option' do
          subject.options[:output].should be_nil
        end
      end

      context 'with options provided' do
        subject { Treetop.new(nil, {:all_on_start => true}) }

        it 'sets the provided :all_on_start option' do
          subject.options[:all_on_start].should be_true
        end
      end

      context 'with :input provided' do
        subject { Treetop.new(nil, {:input => 'lib'}) }

        it 'removes the provided :input' do
          subject.options[:input].should be_nil
        end

        it 'has one watcher' do
          subject.should have(1).watchers
        end

        it 'watchers *.treetop and *.tt files' do
          subject.watchers.first.pattern.should == %r{lib/(.+)(\.treetop|\.tt)}
        end

        context 'and no :output provided' do
          it 'outputs to the same directory as input' do
            subject.options[:output].should == 'lib'
          end
        end

        context 'and :output is provided' do
          let(:options) do
            {:input => 'lib/inputs', :output => 'lib/outputs'}
          end
          subject { Treetop.new(nil, options) }

          it 'respects the provided :output' do
            subject.options[:output].should == 'lib/outputs'
          end
        end
      end
    end

    describe '#start' do
      context 'without all_on_start' do
        it 'should not call run_all' do
          subject.should_not_receive(:run_all)
          subject.start
        end
      end

      context 'with all_on_start' do
        subject { Treetop.new(nil, :all_on_start => true) }

        it 'should call run_all' do
          subject.should_receive(:run_all)
          subject.start
        end
      end
    end

    context 'running without output' do
      subject { Treetop.new(nil, :input => 'inputs') }
      let(:inputs) { ['inputs/1.tt', 'inputs/2.treetop'] }
      let(:outputs) { ['inputs/1.rb', 'inputs/2.rb'] }
      before(:each) { Dir.stub(:glob).and_return(inputs) }

      it 'should call run_on_changes' do
        subject.should_receive(:run_on_changes).with(inputs)
        subject.run_all
      end

      it 'throws :task_has_failed on error' do
        expect { subject.run_on_changes(['/tmp/non_existent']) }.to throw_symbol :task_has_failed
      end

      it 'calls run_on_changes' do
        files = [inputs, outputs].transpose
        subject.compiler.should_receive(:compile).with(*files.first)
        subject.compiler.should_receive(:compile).with(*files.last)
        subject.run_on_changes(inputs)
      end
    end

    context 'running with output' do
      subject { Treetop.new(nil, :input => 'inputs', :output => 'outputs') }
      let(:inputs) { ['inputs/1.tt', 'inputs/2.treetop'] }
      let(:outputs) { ['outputs/1.rb', 'outputs/2.rb'] }
      before(:each) { Dir.stub(:glob).and_return(inputs) }

      it 'calls run_on_changes' do
        files = [inputs, outputs].transpose
        subject.compiler.should_receive(:compile).with(*files.first)
        subject.compiler.should_receive(:compile).with(*files.last)
        subject.run_on_changes(inputs)
      end
    end
  end
end
