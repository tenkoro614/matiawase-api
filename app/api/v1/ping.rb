module V1
  class Ping < Grape::API
    format :json
    get "list/:groupname/:devid/:username/:iconSelect/:latitude/:longitude/:deviceToken" do
      data = Matiawase.find(:all, :conditions => { :groupname => params[:groupname]})
      
      existuser = false;
      data.each do |userlocation|
        puts userlocation.username
        if userlocation.devid == params[:devid] then
          userlocation.username = params[:username]
          userlocation.iconSelect = params[:iconSelect]
          userlocation.latitude = params[:latitude]
          userlocation.longitude = params[:longitude]
          userlocation.deviceToken = params[:deviceToken]
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
        userlocation.deviceToken = params[:deviceToken]
        userlocation.save
        data.push(userlocation)
      end
      
      data
    end

    get :hello do
      {hello: "world"}
    end
    
    get :push do
      # Environment variables are automatically read, or can be overridden by any specified options. You can also
# conveniently use `Houston::Client.development` or `Houston::Client.production`.
APN = Houston::Client.development
APN.certificate = File.read("#{Rails.root}/server_certificates_sandbox.pem")

# An example of the token sent back when a device registers for notifications
token = "<aa08fe0e c7e56d2e 95b9bad6 be2e4450 7e22a93c 80d8e4dd 710ec583 0603794f>"

# Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app
notification = Houston::Notification.new(device: token)
#notification.alert = "Hello, World!"

# Notifications can also change the badge count, have a custom sound, indicate available Newsstand content, or pass along arbitrary data.
#notification.badge = 1
#notification.sound = "sosumi.aiff"
notification.content_available = true
#notification.custom_data = {foo: "bar"}

# And... sent! That's all it takes.
APN.push(notification)
    end
  end
end