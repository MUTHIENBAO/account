

(function($) {
    var locationWrapper = {
        put: function(hash, win) {
            (win || window).location.hash = hash;
        },
        get: function(win) {
            var hash = ((win || window).location.hash).replace(/^#/, '');
            return $.browser.fx ? hash : hash;
        }
    };

    var iframeWrapper = {
        id: "__jQuery_history",
        init: function() {
            var html = '<iframe id="'+ this.id +'" style="display:none" src="javascript:false;" />';
            $("body").prepend(html);
            return this;
        },
        _document: function() {
            return $("#"+ this.id)[0].contentWindow.document;
        },
        put: function(hash) {
            var doc = this._document();
            doc.open();
            doc.close();
            locationWrapper.put(hash, doc);
        },
        get: function() {
            return locationWrapper.get(this._document());
        }
    };

    var _ = {
        appState: undefined,
        callback: undefined,
        init:  function(callback) {},
        check: function() {},
        load:  function(hash) {}
    };
    $.history = _;

    var SimpleImpl = {
        init: function(callback) {
            _.callback = callback;
            var current_hash = locationWrapper.get();
            _.appState = current_hash;
            _.callback(current_hash);
            setInterval(_.check, 100);
        },
        check: function() {
            var current_hash = locationWrapper.get();
            if(current_hash != _.appState) {
                _.appState = current_hash;
                _.callback(current_hash);
            }
        },
        load: function(hash) {
            if(hash != _.appState) {
                locationWrapper.put(hash);
                _.appState = hash;
                _.callback(hash);
            }
        }
    };

    var IframeImpl = {
        init: function(callback) {
            _.callback = callback;
            var current_hash = locationWrapper.get();
            _.appState = current_hash;
            iframeWrapper.init().put(current_hash);
            _.callback(current_hash);
            setInterval(_.check, 100);
        },
        check: function() {
            var current_hash = iframeWrapper.get();
            if(current_hash != _.appState) {
                locationWrapper.put(current_hash);
                _.appState = current_hash;
                _.callback(current_hash);
            }
        },
        load: function(hash) {
            if(hash != _.appState) {
                locationWrapper.put(hash);
                iframeWrapper.put(hash);
                _.appState = hash;
                _.callback(hash);
            }
        }
    };

    if($.browser.msie && ($.browser.version < 8 || document.documentMode < 8)) {
        $.extend(_, IframeImpl);
    } else {
        $.extend(_, SimpleImpl);
    }
})(jQuery);
