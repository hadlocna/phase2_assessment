var form = $('<br><br><form action="/create" method="post" id="create_event_form"><input id="name" type="text" name="name" placeholder="Event Name"><br><input id="location" type="text" name="location" placeholder="Event Location"><br><input type="date" name="starts_at" placeholder="Start Time"><br><input type="date" name="ends_at" placeholder="End Time"><br><input type="submit" value="Submit"></form>')
// var update = $('<div class="event"><p>Event Name: '+ $(<%=data.name%>) +' </p><p>Event Location: <%=data.location%> </p></div>')

$(document).ready(function() {
    console.log('listening to this page')
  $('#create_event').click(function(event){
    console.log('you pushed the button')
    event.preventDefault();
    $('#create_event_form').show();
    $('.container').append(form);
    $('#create_event_form').submit(function(event){
      event.preventDefault();
      console.log('in here')
      $.post('/create',$( this ).serialize() , function(data){
        $('#create_event_form').hide();
        var event_update = $('<div class="event"><p>Event Name: '+ $('#name').val() +  '</p><p>Event Location:' + $('#location').val()+ '</p></div><div id="button"><form action="/edit/<%=event.id%>" method="GET"><input type="submit" value="Edit Event"></form><form action="/delete/<%=event.id%>" method="GET"><input type="submit" value="Delete Event"></form></div>' )
        $('.container').append(event_update)
      });
    });
  });
});