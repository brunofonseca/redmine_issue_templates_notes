// Hide default submit

$(function () {
    hidden_button();

});

function hidden_button() {

    $("#settings").find("input[name=commit]").css("display", "none");
}

function submitPreview(url, form, target) {
  $.ajax({
    url: url,
    type: 'post',
    data: $('#'+form).serialize(),
    success: function(data){
      $('#'+target).html(data);
    }
  });
}
