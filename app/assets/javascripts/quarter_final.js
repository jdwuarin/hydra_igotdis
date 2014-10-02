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
      $(this).find(".minuslogo").css('display', 'none');
      $(this).find(".pluslogo").css('display', 'none');
      $(this).find("h1")[0]["textContent"] = "3";
    }
    else {
      $(this).find(".minuslogo").css('display', 'inline');
      $(this).find(".pluslogo").css('display', 'inline');
      $(this).find("h1")[0]["textContent"] = "0";
      // because if user pressed up it would be type 6
      $(this).parents("div.matches-line").find(
        "form.score-form").children("#prediction_type")[0]["value"] = 7;
    }

  });

  // enable button
  enable_button($(this));


});


$("img.minuslogo").on("click", function(e) {

  var minus_sign = $(this).parent().siblings("div#score").find("h1");

  if (minus_sign[0]["textContent"] == "1"){
    minus_sign[0]["textContent"] = "0";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 7;

  } else if (minus_sign[0]["textContent"] == "2"){
    minus_sign[0]["textContent"] = "1";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 8;

  }

  enable_button($(this));

});


$("img.pluslogo").on("click", function(e) {

  var plus_sign = $(this).parent().siblings("div#score").find("h1");

  if (plus_sign[0]["textContent"] == "0"){
    plus_sign[0]["textContent"] = "1";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 8;

  } else if (plus_sign[0]["textContent"] == "1"){
    plus_sign[0]["textContent"] = "2";

  $(this).parents("div.matches-line").find(
    "form.score-form").children("#prediction_type")[0]["value"] = 9;

  }

  enable_button($(this));

});

$('.comment_zone').bind('keyup', function () {

  enable_button($(this));

});

$("a.btn-submit").on("click", function(e) {

  $(this).parents("div.col-md-12").find(
    "form.winner-form").trigger("submit");
  $(this).parents("div.col-md-12").find(
    "form.score-form").trigger("submit");

});

$("form.winner-form").on('ajax:success', function(data, status, xhr) {

  disable_button($(this));

});

$("form.winner-form").on('ajax:error', function(xhr, status, error) {

    button = $(this).parents("div.col-md-12").
      find("a.btn-submit");

    button[0]["text"] = "There was an error, please try again";
    button.removeClass("btn-default");

});

var disable_button = function(base) {

  button = base.parents("div.col-md-12").
    find("a.btn-submit");

  button.addClass("btn-inactive");

  button[0]["text"] = "SUBMITTED";

  button.append("<i class='fa fa-check'></i>");
};


var enable_button = function(base) {

  button = base.parents("div.col-md-12").
    find("a.btn-submit");

  if (button.hasClass("btn-inactive")) {

    button.removeClass("btn-inactive");
    button[0]["text"] = "SUBMIT";

    button.children("i").remove();

  }

};