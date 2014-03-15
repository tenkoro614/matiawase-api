json.array!(@matiawases) do |matiawase|
  json.extract! matiawase, :id, :groupname, :devid, :username, :iconSelect, :latitude, :longitude
  json.url matiawase_url(matiawase, format: :json)
end
