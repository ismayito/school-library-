def people_file
  if File.exist?('people.json') && !File.empty?('people.json')
    JSON.parse(File.read('people.json'))
  else
    []
  end
end

def books_file
  if File.exist?('books.json') && !File.empty?('books.json')
    JSON.parse(File.read('books.json'))
  else
    []
  end
end

def rentals_file
  if File.exist?('rentals.json') && !File.empty?('rentals.json')
    JSON.parse(File.read('rentals.json'))
  else
    []
  end
end
