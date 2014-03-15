module V1
  class Ping < Grape::API
    format :json
    get "list/:groupname/:devid/:username/:iconSelect/:latitude/:longitude" do
      data = Matiawase.find(:all, :conditions => { :groupname => params[:groupname]})
      
      existuser = false;
      data.each do |userlocation|
        puts userlocation.username
        if userlocation.devid == params[:devid] then
          userlocation.username = params[:username]
          userlocation.iconSelect = params[:iconSelect]
          userlocation.latitude = params[:latitude]
          userlocation.longitude = params[:longitude]
          userlocation.save
          existuser = true;
          break;
        end
      end
      
      if !existuser then
        userlocation = Matiawase.new
        userlocation.groupname = params[:groupname]
        userlocation.devid = params[:devid] 
        userlocation.username = params[:username]
        userlocation.iconSelect = params[:iconSelect]
        userlocation.latitude = params[:latitude]
        userlocation.longitude = params[:longitude]
        userlocation.save
        data.push(userlocation)
      end
      
      data
    end

    get :hello do
      {hello: "world"}
    end
  end
end