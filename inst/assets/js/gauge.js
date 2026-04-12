
Shiny.addCustomMessageHandler('update', function(value) {

        // label.setAttribute('fill-opacity', 0);

        // previous_animation = document.getElementById(animationID)
        // if (previous_animation != null) {
        //   player.removeChild(previous_animation)
        // }
        // player.appendChild(animation)

        const anim = document.getElementById('w1-progress-animate');
        var old_value = anim.getAttribute('to');
        anim.setAttribute('from', old_value);
        anim.setAttribute('to', value['progress']);
        anim.beginElement()

        const label = document.getElementById('w1-label');
        label.textContent = value['label'];

      });
