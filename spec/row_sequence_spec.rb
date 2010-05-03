require 'spec/spec_helper'

describe RowSequence do

  it "should not return the header as the first row" do
    xml = <<EOT
<table>
  <tr><th>One</th></tr>
  <tr><td>value</td></tr>
</table>
EOT
    table_node = Nokogiri::XML.parse(xml).children.first
    row_sequence = RowSequence.new(table_node)
    
    row = row_sequence.first
    row["One"].should eql("value")
  end

  it "should evalate each once for one row" do
    xml = <<EOT
<table>
  <tr><th>One</th></tr>
  <tr><td>value</td></tr>
</table>
EOT
    table_node = Nokogiri::XML.parse(xml).children.first
    row_sequence = RowSequence.new(table_node)
    
    count = 0
    row_sequence.each do |row|
      count+= 1
    end
    count.should eql(1)
  end

end
