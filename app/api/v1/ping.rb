module V1
  class Ping < Grape::API
    format :json

    get :hello do
      {hello: "world"}
    end
  end
end