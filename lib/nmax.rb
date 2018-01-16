class NMax
  class << self
    def run(argv, stdin)
      if valid_argv?(argv)
        n = argv[0].to_i
        numbers = []

        if !stdin.tty?
          while line = gets
            numbers += line.scan(/\d+/).map { |number| number.to_i if number.length <= 1000 }.compact
          end
        else
          puts 'STDIN is empty'
        end

        numbers.sort! { |x, y| y <=> x }

        puts numbers[0 .. (n - 1)]
      else
        puts 'Incorrect params. One integer parameter is expected.'
      end
    end

    private
      def valid_argv?(argv)
        !argv.empty? && argv.count == 1 && argv[0].scan(/\D/).empty? && argv[0].to_i > 0
      end
  end
end