json.user do
  json.id(@user.id)
  json.name(@user.uid)
  json.email(@user.email)
  json.authority(@user.authority)
end
json.result(@result)
