module HaveTable
  class RowMatcher
    def with_cell(params)
      @row_conditions ||= {}
      @row_conditions.merge!(params)
    end

    def matches?(row_sequence)
      # Tester called: have_table { with_row }
      return row_sequence.any? unless @row_conditions

      matches = false
      row_sequence.each do |row|
        row_matches = true
        @row_conditions.each do |key, value|
          unless row[key] == value
            row_matches = false
            break
          end
        end

        if row_matches
          matches = true
          break
        end
      end
      return matches
    end
  end
end
