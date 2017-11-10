$(function () {
  $("#search").on('keyup', function () {
    $.get($("#searches_search").attr("action"), $("#searches_search").serialize(), null, "script");
    return false;
  });
});
$(function () {
  $("#browse").on('change', function(){
    $.get($("#searches_search").attr("action"), $("#searches_search").serialize(), null, "script");
    return false;
  });
});
