
function _showPopup(title, content, callback){
    if(typeof title == 'undefined') title = 'Thông báo';
    if(typeof content == 'undefined') title = '';
    $(".popupContent").html(content);
    $(".popupCaption").html(title);
    $(".popupCenter, .blackBg").fadeIn('fast',function(){
        if(typeof callback == 'function') callback();
    });
}


var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-27772248-1']);
    _gaq.push(['_trackPageview']);
    _gaq.push(["_trackPageLoadTime"]);
  _gaq.push(
  ['secondTracker._setAccount', 'UA-27772248-1'],
  ['secondTracker._trackPageview']
);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();


$(document).ready(function(){

    function _checkHash(){
        var url = window.location.hash;

        if(url.indexOf('#')!=-1)
        {
            var c_url = url.split('#');
            var c_url_last = c_url.length - 1;
            var module = c_url ? c_url[c_url_last] : 'home';
            _pageload('index2.php?mod='+ module,'','BlockLeft');

            var mod_split = module.split('&');
            var mod_pri = mod_split ? mod_split[0] : module;
            var menuactive = mod_pri;
            if(mod_pri = 'event') {
                var act = mod_split[1];
                switch (act){
                    case 'act=giftcode_rs':
                    case 'act=giftcode_week':
                    case 'act=giftcode_month':
                    case 'act=giftcode_tanthu':
                    case 'act=giftcode_change':
                    case 'act=giftcode_history':
                        menuactive = 'giftcode';
                        break;
                }
            }

            $('.nav-item').removeClass('active');
            $('.nav-item[menu-parent=' + menuactive + ']').addClass('active');
        }
    }
    $(window).hashchange( function(){
        _checkHash();
    });
    $(window).hashchange();



    function _initFn(){
        $('a, .money_block span, .bank-icon, .item-box, .ui-tooltipster').tooltipster({
            offsetY: 2
        });
        $(".table-sort").tablesorter();

        $(".menu-main-tabs .main-tab").click(function(){
            var myIndex = $(this).index();
            $(".menu-main-tabs .main-tab, .content-main-tabs .content-m-tab").removeClass('active');
            $(this).addClass('active');
            $(".content-main-tabs .content-m-tab:eq("+myIndex+")").addClass('active');
            
            return false;
        });
        $("input[data-showpopup]").hover(function(){
            var popupShow = $(this).data('showpopup');
            $(".box-popup").removeClass('show');
            var classShow = ".box-popup[data-popup=popup-hover-"+popupShow+"]";
            $(classShow).addClass('show');
        },function(){
            $(".box-popup").removeClass('show');
        });
        $(window).scroll(function(){
            var self = $(this);
            if($(".stage-menu").length){
                var activeTab = $(".content-m-tab.active").index();

                if($(this).scrollTop()>=$(".content-m-tab:eq("+activeTab+") .stage-menu").offset().top-35){
                    $(".content-m-tab:eq("+activeTab+") .stage-menu").addClass('fix');
                }
                else{
                    $(".content-m-tab:eq("+activeTab+") .stage-menu").removeClass('fix');
                }
                $.each($(".content-m-tab:eq("+activeTab+") .trader-block"),function(i,e){
                    var eachThisTab = $(this).index();
                    if( self.scrollTop()>= $(this).context.offsetTop-45){
                        $(".content-m-tab:eq("+activeTab+") .stage-menu ul li").removeClass('active');
                        $(".content-m-tab:eq("+activeTab+") .stage-menu ul li.stage-m-i:eq("+eachThisTab+")").addClass('active');
                    }
                });
            }
        });
        $(".stage-m-i").click(function(){
            var myTab = $(this).data('tab'),
                myRow = $(this).text();
            $("body, html").animate({
                scrollTop : $(".content-m-tab:eq("+myTab+") .trader-block:nth-child("+myRow+")").offset().top-43
            },300);
        });
        $(".stage-menu ul li.stage-m-i").hover(function(){
            var hvIndex = $(this).index();
            var activeTab = $(".content-m-tab.active").index();
            var myTab = $(this).data('tab'),
                myRow = $(this).text();
            console.log(myTab);
            $(".content-m-tab:eq("+myTab+") .trader-block:eq("+(hvIndex-1)+")").addClass('hover');
        },function(){
            var hvIndex = $(this).index();
            var activeTab = $(".content-m-tab.active").index();
            var myTab = $(this).data('tab'),
                myRow = $(this).text();
            $(".content-m-tab:eq("+myTab+") .trader-block:eq("+(hvIndex-1)+")").removeClass('hover');
        });


        
    }

    $(".Tab-Menu").click(function(){
        if( $(".col-left").hasClass('show') ){
            $(".col-left").removeClass('show');
            $("body").removeClass('menu-left-show');
        }
        else{
            $(".col-left").addClass('show');
            $("body").addClass('menu-left-show');
        }
    });
    $(".Tab-Char").click(function(){
        $('html, body').animate({
            scrollTop : $("#Login_Content").offset().top
        },200);
    });
    $(".Tab-Acc").click(function(){
        if( $(".ResultAcc").hasClass('show') ){
            $(".ResultAcc").removeClass('show');
            $("body").removeClass('menu-left-show');
        }
        else{
            $(".ResultAcc").addClass('show');
            $("body").addClass('menu-left-show');
        }
    });



    if($.cookie('left-collap')!=undefined){
        $.each( $('*[data-title]') ,function(){
            $(this).attr( 'title',$(this).data('title') );
        });
        _initFn();
        $(".wrap-fluid").addClass('left-collap');
    }


    $(".menu-collap").click(function(){
        if( $(".wrap-fluid").hasClass('left-collap') ){
            $(".wrap-fluid").removeClass('left-collap');
            $.removeCookie('left-collap');
            $.each( $('*[data-title]') ,function(){
                $(this).removeAttr('title');
            });
            _initFn();
        }
        else{
            $(".wrap-fluid").addClass('left-collap');
            $.cookie('left-collap', 1, { expires: 365 });
            $.each( $('*[data-title]') ,function(){
                $(this).attr( 'title',$(this).data('title') );
            });
            _initFn();
        }

    });


    $(".select-button-character").click(function(){
        if($(".dropdown-select").is(':visible'))
            $(".dropdown-select").fadeOut('fast');
        else{$(".dropdown-select").fadeIn('fast');}

    });

    $("#BlockLeft").on('click','.head-block-tabs li',function(){
        var myTab = $(this).index();
        $(".head-block-tabs li, .head-sub-tabs .head-sub").removeClass('active');
        $(this).addClass('active');
        $(".head-sub-tabs .head-sub:eq("+myTab+")").addClass('active');
    });

    $(".blackBg, .popupClose").click(function(){
        $('.blackBg').hide();
        $(".popupCenter").hide();
        $(".guideShow").removeClass('guideShow');
    });

    $("#BlockLeft").on('click','#vpoint_gate input[name=card]',function(){
        var this_card = $(this).val().toLowerCase();
        $(".current-card #image-card").attr('class','')
            .addClass('image-card card-'+this_card);
    });

    _initFn();
    $(document).ajaxComplete(function(){
        _initFn();
    });



});