let faves = [];

$('input[type=checkbox]').change(function(){
  faves = [];
  $('.favorites').empty();
  $('input[type=checkbox]:checked').each(function(){
      faves.push(this.value);
  }).get();
});

$('.faves-button').on('click', function() {
  $(faves).each(function(fave){
    fetch(`https://localhost:3000/api/v1/users/${current_user_id}/favorites`, {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ "favorites": { "title": `${fave[0]}`, "source": `${fave[1]}`, "url": `${fave[2]}`} })
    })
  })
})
