//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function () {
  $(".secret-email").each(function () {
    $(this).text($(this).data("email").replace("|", "@"));
  });
});
