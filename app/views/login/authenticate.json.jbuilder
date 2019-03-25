json.set! :user
  json.id(@user.id)
  json.name(@user.name)
  json.email(@user.email)
  json.authority(@user.authority)
  json.result(@result)
end
