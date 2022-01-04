json.array! @requested_books do |bl|
    json.id bl.id 
    json.bookname  bl.bookname
    json.description bl.description
  
   
end