function formattedDate() {
  var today = new Date()
  var month = today.getMonth() + 1
  var day = today.getDate()

  return ('0' + (today.getMonth()+1)).slice(-2) + '/' + ('0' + today.getDate()).slice(-2);
}

function loadPrompt(date) {
  var request = new XMLHttpRequest();
  request.onload = function() {
    if (request.status >= 200 && request.status < 400) {
      var temp = document.createElement('div')
      temp.innerHTML = request.responseText
      var newMain = temp.getElementsByTagName('main').item(0)
      var main = document.body.getElementsByTagName('main').item(0)
      main.innerHTML = newMain.innerHTML
    }
  };

  request.open("GET", "?date=" + date, true);
  request.send();
}

loadPrompt(formattedDate())
