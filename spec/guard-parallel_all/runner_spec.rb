# vi: set fileencoding=utf-8

module Guard::ParallelAll
  describe Runner, "#run_all" do
    include Ans::Feature::Helpers::ActionHelper

    before do
      @task_name = "TASK"
      @options = {}

      the_action do
        stub(Runner).system
        stub(Runner).bundler?{@bundler}
        Runner.run @task_name, @options
      end
    end

    context "すべて無効な場合" do
      it "は、素のコマンドをコールする" do
        the_action
        Runner.should have_received.system("rake parallel:TASK")
      end
    end

    context "rvm オプションを指定した場合" do
      before do
        @options[:rvm] = ["--option1","--option2"]
      end
      it "は、 rvm 経由でコールする" do
        the_action
        Runner.should have_received.system("rvm --option1,--option2 exec rake parallel:TASK")
      end
    end

    context "bundle 経由で実行する場合" do
      before do
        @bundler = true
      end
      it "は、 bundle 経由でコールする" do
        the_action
        Runner.should have_received.system("bundle exec rake parallel:TASK")
      end
    end

    context "bundler が有効だが、無効にして実行する場合" do
      before do
        @bundler = true
        @options[:bundler] = false
      end
      it "は、 bundle 経由でコールしない" do
        the_action
        Runner.should have_received.system("rake parallel:TASK")
      end
    end

    context "全部有効な場合" do
      before do
        @options[:rvm] = ["--option1","--option2"]
        @bundler = true
      end
      it "は、 bundle 経由でコールしない" do
        the_action
        Runner.should have_received.system("rvm --option1,--option2 exec bundle exec rake parallel:TASK")
      end
    end

  end
end
