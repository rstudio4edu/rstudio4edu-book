$(document).ready(function() {
  // Copy Button
  $chunks = $('pre.sourceCode > code.sourceCode');
  $chunks.each(function(i, val) {
    $(this).prepend("<button class=\"button copy\"><i class=\"fa fa-copy fa-2x\"></i></button>").click(function() {
      var $temp = $("<textarea>");
      $("body").append($temp);
      var content = $(this).clone().children("button").remove().end().text();
      $temp.val(content).select();
      document.execCommand("copy");
      $temp.remove();
    });
  });
});