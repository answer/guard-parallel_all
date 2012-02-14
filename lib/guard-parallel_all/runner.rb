module Guard::ParallelAll
  module Runner
    class << self
      def run(task_name,options)
        exec_command task_name, options
      end

      private

      def exec_command(task_name,options)
        puts "execute parallel #{task_name}..."
        system command(task_name,options)
      end
      def command(task_name,options)
        cmd = []
        cmd << "rvm #{options[:rvm].join(',')} exec" if options[:rvm].is_a?(Array)
        cmd << "bundle exec" if bundler? && options[:bundler] != false

        cmd << "rake parallel:#{task_name}"
        cmd.join(' ')
      end
      def bundler?
        @bundler ||= File.exist?("#{Dir.pwd}/Gemfile")
      end
    end
  end
end
