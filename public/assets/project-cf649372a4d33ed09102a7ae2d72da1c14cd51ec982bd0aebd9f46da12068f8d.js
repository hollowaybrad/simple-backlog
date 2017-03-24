  var ready;
  ready = function() {

    $("#user_id").change(function() {
        this.form.submit();
    });

  };

  $(document).ready(ready);
  $(document).on('page:load', ready);
