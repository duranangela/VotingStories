let faves = [];

$('input[type=checkbox]').change(function(){
  faves = [];
  $('input[type=checkbox]:checked').each(function(){
      data = (this.value).split("-&-")
      faves.push(data);
  }).get();
});

$('.faves-button').on('click', function() {
  $.each(faves, function(index, fave){
    fetch(`http://localhost:3000/api/v1/users/${current_user_id}/favorites`, {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ "favorite": { "title": `${fave[0]}`, "source": `${fave[1]}`, "url": `${fave[2]}`} })
    })
  })
})
