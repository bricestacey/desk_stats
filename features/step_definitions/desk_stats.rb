Then /^I should see the title "([^"]*)"$/ do |arg1|
  Then "I should see \"#{arg1}\" within \"title\""
end

Then /^I should see an? "([^"]*)" action item$/ do |arg1|
  Then "I should see \"#{arg1}\" within \".action_items\""
end

Then /^I should see the following action items:$/ do |table|
  table.hashes.each do |row|
    Then "I should see an \"#{row[0]}\" action item"
  end
end

Then /^I should see the following breadcrumbs:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |crumb|
    Then "I should see \"#{crumb[:text]}\" within \".breadcrumbs\""
  end
end

# http://makandra.com/notes/763-cucumber-step-to-match-table-rows-with-capybara
Then /^I should( not)? see the following table rows( in any order)?:?$/ do |negate, unordered, expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.xpath('//table//tr').collect { |row| row.xpath('.//th|td') }
  expected_table = if expected_table.is_a?(String)
    # multiline string. split it assuming a format like cucumber tables have.
    expected_table.split(/\n/).collect do |line|
      line.sub!(/^\|/, '')
      line.sub!(/\|$/, '')
      line.split(/\s*\|\s*/)
    end
  else
    # vanilla cucumber table.
    expected_table.raw
  end
  expectation = negate ? :should_not : :should
  expected_table.all? do |expected_row|
    first_row = rows.find_index do |row|
      expected_row.all? do |expected_column|
        first_column = row.find_index do |column|
          content = column.content.gsub(/[\r\n\t]+/, ' ').gsub(/[ ]+/, ' ').strip
          content.include? expected_column.gsub('  ', ' ').strip
        end
        if first_column.nil?
          false
        else
          row = row[(first_column + 1)..-1]
          true
        end
      end
    end
    if first_row.nil?
      false
    else
      if unordered
        rows.delete_at(first_row)
      else
        rows = rows[(first_row + 1)..-1]
      end
      true
    end
  end.send(expectation, be_true)
end

Given /^I have selected the "([^"]*)" location$/ do |name|
  Given "I am on the select location page"
  When  "I follow \"#{name}\""
end
