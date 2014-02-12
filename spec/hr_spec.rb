require 'spec_helper'

module Hr
  describe Hr do
    describe "#get_column_width" do
      it "gets the console width" do
        Hr.should_receive(:`).with("tput cols").and_return("200")
        Hr.get_column_width.should == 200
      end

      it "returns 80 by default" do
        Hr.should_receive(:`).with("tput cols").and_return(nil)
        Hr.get_column_width.should == 80
      end
    end

    describe "#string" do
      before(:each) do
        Hr.should_receive(:get_column_width).and_return(5)
      end

      it "returns the string repeated" do
        Hr.string("=").should == "====="
      end

      it "returns the string repeated as a pattern" do
        Hr.string("=+").should == "=+=+="
      end

      it "returns the string with length equal to console width" do
        Hr.string("=======").should == "====="
      end

      it "returns a string with color" do
        Hr.string("=", :color => :blue).should == "\e[0;34;49m=====\e[0m"
      end

      it "returns a string with background color" do
        Hr.string("=", :background => :blue).should == "\e[0;39;44m=====\e[0m"
      end

      it "returns a string with mode" do
        Hr.string("=", :mode => :bold).should == "\e[1;39;49m=====\e[0m"
      end
    end

    describe "#print" do
      before(:each) do
        Hr.should_receive(:get_column_width).and_return(5)
        $stdout.should_receive(:puts).with("=====").and_return(nil)
      end

      it "should print the string repeated" do
        Hr.print("=")
      end

      it "should not return anything" do
        Hr.print("=").should == nil
      end
    end
  end
end
