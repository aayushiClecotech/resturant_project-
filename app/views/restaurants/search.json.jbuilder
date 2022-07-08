json.array!(@users) do |user|
  json.name restaurant.name 
  json.link  'https://google.com/search?q=' +
            CGI.escape(restaurant.name)
end