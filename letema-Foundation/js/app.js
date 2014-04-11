// Foundation
$(document).foundation();

// Plugins
$(document).ready(function() {
    // calculateHeight();

    // Scroller
    $('.left-off-canvas-menu ').jScrollPane({
        showArrows: true
    });

    // sidebar modals
    $("#notificacion-modal").kendoWindow({
        visible: false,
        resizable: false,
        draggable: false,
        width: "500px",
        height: "300px",
        position: {
            top: 0,
            left: "30%"
        },
        animation: {
            open: {
                effects: "slideIn:down fadeIn"
            },
            close: {
                effects: "slide:up fadeOut",
                duration: 200
            }
        },
        actions: ["Pin", "Refresh", "Maximize", "Close"],
        title: "Customer details"
    });
    $("#notificacion")
        .bind("click", function() {
            $("#notificacion-modal").data("kendoWindow").open();
            undo.hide();
        });
    $("#mensajes-modal").kendoWindow({
        visible: false,
        width: "500px",
        height: "200px",
        modal: true,
        actions: ["Pin", "Refresh", "Maximize", "Close"],
        title: "Customer details"
    });
    $("#mensajes")
        .bind("click", function() {
            $("#mensajes-modal").data("kendoWindow").open().center();
            undo.hide();
        });

    // navigation list
    $("#nav").kendoPanelBar();


$(".icon-toolsbar").click(function(){
hideSideNav();
});
    // $(".corner-flip").each(function(i) {
    //     $(this).append('<div class="flip" />');
    // });

    $('.fullscreen').click(function() {
        toggleFullScreen();
        $(this).find("i").toggleClass("resize_full");
        $(this).find("i").toggleClass("resize_small");
    });

    function toggleFullScreen() {
            if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen) || (document.msRequestFullscreen !== null)) {
                if (document.documentElement.requestFullScreen) {
                    document.documentElement.requestFullScreen();
                } else if (document.documentElement.mozRequestFullScreen) {
                    document.documentElement.mozRequestFullScreen();
                } else if (document.documentElement.webkitRequestFullScreen) {
                    document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                } else if (document.documentElement.msRequestFullscreen) {
                    document.documentElement.msRequestFullscreen();
                }
            } else {
                if (document.cancelFullScreen) {
                    document.cancelFullScreen();
                } else if (document.mozCancelFullScreen) {
                    document.mozCancelFullScreen();
                } else if (document.webkitCancelFullScreen) {
                    document.webkitCancelFullScreen();
                } else if (document.msExitFullscreen) {
                    document.msExitFullscreen();
                }
            }
        }


});

function calculateHeight() {
    var contentHeight = parseInt($('#main-content').height());
}

function showSideNav() {
    $('.left-off-canvas-menu').css({
        '-webkit-transform': 'none',
        '-moz-transform': 'none',
        '-ms-transform': 'none',
        '-o-transform': 'none',
        'transform': 'none',
        'position': 'static',
        'float': 'left'
    }, 3000);
    $('.move-right > .inner-wrap').css({
        '-webkit-transform': 'none',
        '-moz-transform': 'none',
        '-ms-transform': 'none',
        '-o-transform': 'none',
        'transform': 'none'
    }, 3000);
}

function hideSideNav() {
     $('.left-off-canvas-menu').css({
        '-webkit-transform': 'translate3d(-100%, 0px, 0px)',
        '-moz-transform': 'translate3d(-100%, 0px, 0px)',
        '-ms-transform': 'translate3d(-100%, 0px, 0px)',
        '-o-transform': 'translate3d(-100%, 0px, 0px)',
        'transform': 'translate3d(-100%, 0px, 0px)',
        'position': 'static',
        'float': 'left'
    }, 3000);
    $('.move-right > .inner-wrap').css({
        '-webkit-transform': 'translate3d(-100%, 0px, 0px)',
        '-moz-transform': 'translate3d(-100%, 0px, 0px)',
        '-ms-transform': 'translate3d(-100%, 0px, 0px)',
        '-o-transform': 'translate3d(-100%, 0px, 0px)',
        'transform': 'translate3d(-100%, 0px, 0px)'
    }, 3000);
   // $('#main-content').css({
   //      'margin-left': '0';
   //  }, 3000);

}
