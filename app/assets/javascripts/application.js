let faves = [];
let delFaves = [];

$('input[name=title]').change(function(){
  faves = [];
  $('input[name=title]:checked').each(function(){
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

$('input[name=fave]').change(function(){
  delFaves = [];
  $('input[name=fave]:checked').each(function(){
      delFaves.push(this.value);
  }).get();
});

$('.delete-button').on('click', function() {
  $.each(delFaves, function(index, fave_id){
    fetch(`http://localhost:3000/api/v1/users/${current_user_id}/favorites/${fave_id}`, {
      method: 'delete'
    })
  });
  location.reload();
})
