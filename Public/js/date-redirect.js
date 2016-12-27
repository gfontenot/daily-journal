var today = new Date()
var month = today.getMonth() + 1
var day = today.getDate()
date = ('0' + (today.getMonth()+1)).slice(-2) + '/' + ('0' + today.getDate()).slice(-2);

window.location.replace("?date=" + date)
