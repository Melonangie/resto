// Foundation
$(document).foundation();

// Plugins
$(document).ready(function() {
    // calculateHeight();
    // Scroller
 $('.left-off-canvas-menu ').jScrollPane({showArrows: true});

$('.jspTrack').css({'height' : '89%'});


    // Breakpoints.js



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



});

function calculateHeight() {
    var contentHeight = parseInt($('#main-content').height());
}


//////////     OFF CANVAS MENU      //////////
// Menu right
$('nav#menu-right').mmenu({
    position: 'right',
    counters: true,
    searchfield: {
        add: true,
        search: true,
        showLinksOnly: false,
    }
});
// Menu Left
var navMenu = $("nav#menu");
navMenu.each(function(i) {
    var nav = $(this),
        data = nav.data();
    nav.mmenu({
        searchfield: data.search ? false : true,
        slidingSubmenus: true
    }).on("closing.mm", function() {
        var highest = $(this).find("ul.mm-highest");
        highest.find(".mm-subclose").trigger('click');
        setTimeout(function() {
            closeSub()
        }, 200);
    });
});

$(".nav-mini").on('click', function() {
    $("body").toggleClass("in");
    closeSub();
    if ($(window).width() < 991) {
        navMenu.trigger('open.mm');
    }
});

// function Auto close sub menu

function closeSub() {
    if (navMenu.hasClass("mm-vertical")) {
        navMenu.find("li").each(function(i) {
            $(this).removeClass("mm-opened");
        });
    } else {
        navMenu.find("ul").each(function(i) {
            if (i == 0) {
                $(this).removeClass("mm-subopened , mm-hidden").addClass("mm-current");
            } else {
                $(this).removeClass("mm-opened , mm-subopened , mm-current  , mm-highest").addClass("mm-hidden");
            }
        });
    }
}

//////////     TOGGLE  OPEN LEFT CANVAS MENU      //////////
$("body").append('<div class="toggle-menu"/>');
$('body').on("click", ".toggle-menu", function(e) {
    e.stopImmediatePropagation();
    e.preventDefault();
    $('nav#menu').trigger('open.mm');
});


//////////     TOUCH TO OPEN CANVAS MENU      //////////
$('li[data-counter-color]').each(function(i) {
    var counter = $(this).find("em.mm-counter");
    counter.css({
        "background-color": $.fillColor($(this)),
        "color": "#FFF"
    });
});


//////////     TOUCH TO OPEN CANVAS MENU      //////////
var nav = document.getElementById("nav");
if (nav) {
    var wrapper = Hammer(nav);
    wrapper.on("dragright", function(event) { // hold , tap, doubletap ,dragright ,swipe, swipeup, swipedown, swipeleft, swiperight
        if ((event.gesture.deltaY <= 7 && event.gesture.deltaY >= -7) && event.gesture.deltaX > 100) {
            $('nav#menu').trigger('open.mm');
        }
    });
    wrapper.on("dragleft", function(event) {
        if ((event.gesture.deltaY <= 5 && event.gesture.deltaY >= -5) && event.gesture.deltaX < -100) {
            $('nav#contact-right').trigger('open.mm');
        }
    });
}
//////////     CORNER FLIP    //////////
$(".corner-flip").each(function(i) {
    $(this).append('<div class="flip" />');
});

//////////     TEXTAREA  AUTO SIZE    //////////
$('textarea[data-height="auto"]').autosize();

//////////     FULLSCREEN  TOGGLE     //////////
$('.fullscreen').click(function() {
    toggleFullScreen();
    $(this).find("i").toggleClass("fa-expand");
    $(this).find("i").toggleClass("fa-compress");
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
