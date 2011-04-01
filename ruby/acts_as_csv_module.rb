class CsvRow

    def method_missing name, *args
        @row_map[name.to_s] if @row_map.has_key?(name.to_s)
    end

    def initialize row_map
        @row_map = row_map
    end

end

module ActsAsCsv

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods

        include Enumerable

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                add CsvRow.new(Hash[@headers.zip(row.chomp.split(', '))])
            end
        end

        def each
            @csv_contents.each { |i| yield i}
        end

        def add row
            @csv_contents << row
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

    end

end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
m.csv_contents.each {|row| puts row.y}
