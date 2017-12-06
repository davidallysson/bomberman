(function($){
  $(function(){

    $('.button-collapse').sideNav();

    $(window).resize(function() {
      if ($('html').innerWidth() < 992)
        $('.card').removeClass('horizontal');
      else
        $('.card').addClass('horizontal');
    });

  }); // end of document ready
})(jQuery); // end of jQuery name space
