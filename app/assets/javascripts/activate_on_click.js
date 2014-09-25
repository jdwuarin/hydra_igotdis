$('th.Logo').on('click', function (event) {

  // make th object active
  $(this).siblings('th').removeClass('active');
  $(this).addClass('active');

  // update the form
  var predicted_contestant = $(this).children("div")[0]["className"];
  var input_to_change = $(this).siblings("input")[0];
  input_to_change["value"] = predicted_contestant;

  // enable button
  $(this).parents("table").
    siblings("div.submitmatch").
    children("input").prop('disabled', false);

});
