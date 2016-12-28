$(document).ready(function() {
  $("#_datepicker").datepicker({
    onSelect: function(dateText, inst) {
      var date = dateText.split("/").slice(0, 2).join("/");
      window.location.href = "?date=" + date
    },
    beforeShow: function (event, ui) {
      var $link = $("#datepicker");
      ui.dpDiv.offset({
        top: $link.offset().top + 10,
        left: $link.offset().left + 100
      });
    }
  });

  $("#datepicker").click(function() {
    $("#_datepicker").datepicker("show");
  });
});
