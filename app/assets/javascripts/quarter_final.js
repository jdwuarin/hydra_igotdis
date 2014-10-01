$('th.Logo').on('click', function (event) {

  // make the object active
  $(this).siblings('th').removeClass('active');
  $(this).addClass('active');

  // update the form
  var predicted_contestant = $(this).children(
    "div.contestant")[0]["textContent"];

  var input_to_change = $(this).parents("div.matches-line").
    find("form.winner-form").children("#predicted_contestant_id")[0];
  input_to_change["value"] = predicted_contestant;

  // deal with making plus minus buttons appear
  // and the value of the score

  var table_row = $(this).parents("div.matches-line").find(
    "tbody.scorelol").children("tr");

  console.tr(table_row);

  table_row.children("th#" + predicted_contestant).
    children("h1")["text"] = 2;

  // // enable button
  // button = $(this).parents("table").
  //   siblings("div.submitmatch").
  //   children("input");

  // button.prop('disabled', false);

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

$("a.btn-submit").on("click", function(e) {

  $(this).parents("div.col-md-12").find(
    "form.winner-form").trigger("submit");
  $(this).parents("div.col-md-12").find(
    "form.score-form").trigger("submit");

});