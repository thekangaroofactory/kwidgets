
Shiny.addCustomMessageHandler('update_progress', function(value) {

  const anim = document.getElementById(value['id'].concat('-progress-animate'));
  var old_value = anim.getAttribute('to');
  anim.setAttribute('from', old_value);
  anim.setAttribute('to', value['progress']);
  anim.beginElement()

});
