$('th.Logo').on('click', function (event) {

  // make the object active
  $(this).siblings('th').removeClass('active');
  $(this).addClass('active');

  // update the forms (predicted contestant depends only on this click)
  var predicted_contestant = $(this).children(
    "div.contestant")[0]["textContent"];

  $(this).parents("div.matches-line").find(
    "form").children("#predicted_contestant_id").each(function() {

      $(this)[0]["value"] = predicted_contestant;

  });


  // deal with making plus minus buttons appear
  // and the value of the score

  var table_row = $(this).parents("div.matches-line").find(
    "tbody.scorelol").children("tr");

  table_row.children().each(function () {

    if ($(this)[0]["id"] == predicted_contestant) {
      $(this).find(".minuslogo").hide();
      $(this).find(".pluslogo").hide();
      $(this).find("h1")[0]["textContent"] = "2";
    }
    else {
      $(this).find(".minuslogo").show();
      $(this).find(".pluslogo").show();
      $(this).find("h1")[0]["textContent"] = "0";
      // because if user pressed up it would be type 6
      $(this).parents("div.matches-line").find(
        "form.score-form").children("#prediction_type")[0]["value"] = 5;
    }

  });

  // // enable button
  // button = $(this).parents("table").
  //   siblings("div.submitmatch").
  //   children("input");

  // button.prop('disabled', false);

});

$("a.btn-submit").on("click", function(e) {

  $(this).parents("div.col-md-12").find(
    "form.winner-form").trigger("submit");
  $(this).parents("div.col-md-12").find(
    "form.score-form").trigger("submit");

});

$("img.minuslogo").on("click", function(e) {

  var minus_sign = $(this).parent().siblings("div#score").find("h1");

  if (minus_sign[0]["textContent"] == "1"){
    minus_sign[0]["textContent"] = "0";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 5;

  }

});


$("img.pluslogo").on("click", function(e) {

  var plus_sign = $(this).parent().siblings("div#score").find("h1");

  if (plus_sign[0]["textContent"] == "0"){
    plus_sign[0]["textContent"] = "1";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 6;

  }

});

$("form.winner-form").on('ajax:success', function(data, status, xhr) {

    button = $(this).parents("table.responsive").
      siblings("div.submitmatch").
        children("input")[0];

    if (!button["disabled"]) {
      button["value"] = "UPDATE";
      button["disabled"] = true;
    }

});

$("form.winner-form").on('ajax:error', function(xhr, status, error) {

    button = $(this).parents("div.col-md-12").
      find("a.btn-submit");

    button[0]["text"] = "There was an error, please try again";
    button.removeClass("btn-default");

});