# vi: set fileencoding=utf-8

module Guard::ParallelAll
  describe :Runner do
    it "は、 autoload される" do
      Runner.should be_true
    end
  end
end
module Guard
  describe :ParallelAllSpec do
    it "は、存在する" do
      ParallelAllSpec.should be_true
    end
  end
  describe :ParallelAllFeatures do
    it "は、存在する" do
      ParallelAllFeatures.should be_true
    end
  end
end
