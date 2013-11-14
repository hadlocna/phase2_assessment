helpers do

def create_event
 Event.create(user_id: session[:id], name: params[:name], location: params[:location], starts_at: params[:starts_at], ends_at: params[:ends_at])
end

def delete_event
  event = Event.find(params[:event_id])
  event.destroy
end

def update_event
  event = Event.find(params[:event_id])
  event.name = params[:name]
  event.location = params[:location]
  event.starts_at = params[:starts_at]
  event.ends_at = params[:ends_at]
  event.save
end

end