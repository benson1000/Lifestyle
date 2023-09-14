document.addEventListener("DOMContentLoaded", function() {
    var flashMessages = document.getElementsByClassName('alert');
    for (var i = 0; i < flashMessages.length; i++) {
      (function(message) {
        setTimeout(function() {
          message.style.opacity = '0';
          setTimeout(function() {
            message.style.display = 'none';
          }, 300);
        }, 3000);
      })(flashMessages[i]);
    }
});