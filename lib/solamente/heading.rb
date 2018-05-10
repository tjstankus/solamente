module Solamente
  class Heading
    attr_reader :line, :todo_keywords

    def initialize(line, todo_keywords)
      @line = line
      @todo_keywords = todo_keywords
    end

    def cycle_todo_keyword
      [ match_line[:stars],
        next_todo_keyword(match_line[:todo_keyword]),
        match_line[:heading_text]].reject(&:empty?).join(" ")
    end

    def next_todo_keyword(current_keyword)
      wrapped_keywords[wrapped_keywords.index(current_keyword.to_s) + 1]
    end

    def match_line
      @match ||= line.match(%r{
        # beginning of line, some number of stars, space
        (?<stars>^\*+)\040
        # optional capture group for keyword
        ?(?<todo_keyword>#{todo_keywords.join('|')})?\040
        # rest of line is heading text
        (?<heading_text>.*)}x)
    end

    def wrapped_keywords
      @wrapped_keywords ||= Array.new(todo_keywords).prepend("").append("")
    end
  end
end
