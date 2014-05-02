class API_V1 < Grape::API
  prefix 'v1' # とりあえずprefixだけつけている
  mount V1::Base
end