$(document).ready(function() {
    $('.date').mask('99.99.9999');
    $('.date').datepicker();
    $('.date').datepicker("option", "dateFormat", "dd.mm.yy");
    $('.hour').mask('99:99');
    $('.psc').mask('999 99');
    $('.phone').mask('+420999999999');
    $('.numeric').ForceNumericOnly();
});

jQuery.fn.ForceNumericOnly =
function() {
    return this.each(function() {
        $(this).keydown(function(e) {
            var key = e.charCode || e.keyCode || 0;
            // allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
            return (
                key == 8 ||
                key == 9 ||
                key == 46 ||
                (key >= 37 && key <= 40) ||
                (key >= 48 && key <= 57) ||
                (key >= 96 && key <= 105));
        })
    })
};