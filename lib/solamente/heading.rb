module Solamente
  class Heading
    attr_reader :line

    def initialize(line)
      @line = line
    end

    def cycle_todo_state(states)
      line.gsub("* ", "* #{states.first} ")
    end
  end
end
