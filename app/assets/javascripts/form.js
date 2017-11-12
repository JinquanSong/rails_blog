$(document).ready(function(){
    $(function() {
        return $('.chosen-select').chosen({
            allow_single_deselect: true,
            no_results_text: 'No results matched',
            width: '100%'
        });
    });

    $('[data-toggle="offcanvas"]').click(function(){
        $('#side-menu').toggleClass('hidden-xs');
    });

    $('.summernote').each(function(){
        $(this).summernote({
            height: 200
        });
    })
})