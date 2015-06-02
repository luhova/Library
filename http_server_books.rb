require 'socket'
require './app/controllers/books_controller'

def message_ok(response)(response)
  "HTTP/1.1 200 OK\r\n" +
  "Content-Type: text/html\r\n" +
  "Content-Length: #{response.bytesize}\r\n" +
  "Connection: close\r\n"
end

def message_not_found(response)(response)
  "HTTP/1.1 404 Not Found\r\n" +
  "Content-Type: text/html\r\n" +
  "Content-Length: #{response.size}\r\n" +
  "Connection: close\r\n"
end

webserver = TCPServer.new('127.0.0.1', 4913)
while(session = webserver.accept)
  request = session.gets
  trimmed_request = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')
  path = trimmed_request.chomp.split('?')[0]
  case path
  when'books'
    response = BooksController.all_books_web('books')
    session.print message_ok(response)
    session.print "\r\n"
    session.print response
  when 'book/isbn'
    isbn = trimmed_request.chomp.split('?')[1].split('=')[1].to_i
    response = BooksController.find_book_web(isbn)
    session.print message_ok(response)
    session.print "\r\n"
    session.print response
  when 'books/sort/year'
    response = BooksController.all_books_web('sort_by_year')
    session.print message_ok(response)
    session.print "\r\n"
    session.print response
  when 'books/sort/rating'
    response = BooksController.all_books_web('sort_by_rating')
    session.print message_ok(response)
    session.print "\r\n"
    session.print response
  else
    response = BooksController.not_found
    session.print message_not_found(response)
    session.print "\r\n"
    session.print response
  end
  session.close
end