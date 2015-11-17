$(function () {

    //making the application navigation to auto-highlight
    var pages = ["new_app", "pers_info", "app_info", "educ_hist", "empl_hist", "entr_test"];
    var selectors = pages.map(function (page) {
        return "#" + page + " #link_" + page;
    });

    selectors.forEach(function (s) {
        $(s).addClass('active').removeAttr("href");
    });

    //make menus drop down automatically
    $('ul.nav li.dropdown').hover(function () {
        $('.dropdown-menu', this).fadeIn();
    }, function () {
        $('.dropdown-menu', this).fadeOut('fast');
    });//hover

    //activate datepicker
    $('#sandbox-container .input-group.date').datepicker({});

});
