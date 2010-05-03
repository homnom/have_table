module HaveTable
  class HaveTable
    def matches?(response, &block)
      @response = response
      @document = Webrat::XML.document(response)
      @table_nodes = @document.xpath("//table")
      if (block_given?)
        # Asked: have_table { ... }
        block.bind(self).call
        return matches_conditions?
      else
        # Asked: have_table
        return @table_nodes.length > 0
      end
    end

    def failure_message_for_should
      "expected that #{@response} would have a table"
    end

    def failure_message_for_should_not
      "expected that #{@response} would not have a table"
    end

    def with_row(&block)
      @table_conditions ||= []

      row_matcher = RowMatcher.new
      if block_given?
        block.bind(row_matcher).call
      end
      @table_conditions << row_matcher
    end
    
    def matches_conditions?
      any_tables_match = false
      @table_nodes.each do |table_node|
        row_sequence = RowSequence.new(table_node)
        table_matches = true
        @table_conditions.each do |row_matcher|
          unless row_matcher.matches?(row_sequence)
            table_matches = false
            break
          end
        end
        if table_matches
          any_tables_match = true
          break
        end
      end
      return any_tables_match
    end
  end
end
