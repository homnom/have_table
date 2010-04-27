class RowSequence 
  include Enumerable

  def initialize(table_node)
    raise "did not receive a <table> node" unless table_node.name == "table"

    @tr_nodes = table_node.xpath("tr")
    read_header
  end

  def each
    reset
    while true
      if is_on_header?
        next_row
        next
      end
      row = next_row
      break unless row
      yield(row)
    end
  end

  private
  
  def reset
    @index = 0
  end

  def more?
    @index < @tr_nodes.length
  end

  def next_row
    return nil unless more?
    td_nodes = next_row_node
    row_texts = td_nodes.children.map{|node|node.text}
    Hash[@header.zip(row_texts)]
  end
  
  def read_header
    @index = -1
    while true
      @index+= 1
      if is_on_header?
        @header = peek_row_node.children.map { |node| node.text }
        break
      end
    end
  end

  def is_on_header?
    return false unless more?
    tag_names = peek_row_node.children.map { |node| node.name }
    tag_names.length > 0 && !tag_names.detect { |tag_name| tag_name != "th" && tag_name != "text" }
  end
  
  def peek_row_node
    @tr_nodes[@index] if more?
  end

  def next_row_node
    rval = peek_row_node
    @index+= 1
    rval
  end
end
