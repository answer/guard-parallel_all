# vi: set fileencoding=utf-8

module Guard::ParallelAll
  describe :Runner do
    it "は、 autoload される" do
      Runner.should be_true
    end
  end
end
