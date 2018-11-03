let faves = [];

$('input[type=checkbox]').change(function(){
  faves = [];
  $('.favorites').empty();
  $('input[type=checkbox]:checked').each(function(){
      faves.push(this.value);  
  }).get();
  $('.favorites').append(faves);
});
