!function(){var n={},e=function(e){for(var t=n[e],i=t.deps,o=t.defn,u=i.length,a=new Array(u),c=0;c<u;++c)a[c]=r(i[c]);var s=o.apply(null,a);if(void 0===s)throw"module ["+e+"] returned undefined";t.instance=s},t=function(e,t,r){if("string"!=typeof e)throw"module id must be a string";if(void 0===t)throw"no dependencies for "+e;if(void 0===r)throw"no definition function for "+e;n[e]={deps:t,defn:r,instance:void 0}},r=function(t){var r=n[t];if(void 0===r)throw"module ["+t+"] was undefined";return void 0===r.instance&&e(t),r.instance},i=function(n,e){for(var t=n.length,i=new Array(t),o=0;o<t;++o)i[o]=r(n[o]);e.apply(null,i)};({}).bolt={module:{api:{define:t,require:i,demand:r}}};var o=t;(function(n,e){o(n,[],function(){return e})})("5",tinymce.util.Tools.resolve),o("1",["5"],function(n){return n("tinymce.PluginManager")}),o("6",[],function(){var n=function(n,e){for(var t="",r=0;r<e;r++)t+=n;return t},e=function(n){return!!n.plugins.visualchars&&n.plugins.visualchars.isEnabled()};return{insertNbsp:function(t,r){var i=e(t)?'<span class="mce-nbsp">&nbsp;</span>':"&nbsp;";t.insertContent(n(i,r)),t.dom.setAttrib(t.dom.select("span.mce-nbsp"),"data-mce-bogus","1")}}}),o("2",["6"],function(n){return{register:function(e){e.addCommand("mceNonBreaking",function(){n.insertNbsp(e,1)})}}}),o("7",[],function(){return{getKeyboardSpaces:function(n){var e=n.getParam("nonbreaking_force_tab",0);return"boolean"==typeof e?!0===e?3:0:e}}}),o("3",["7","6"],function(n,e){return{setup:function(t){var r=n.getKeyboardSpaces(t);r>0&&t.on("keydown",function(n){if(9===n.keyCode){if(n.shiftKey)return;n.preventDefault(),e.insertNbsp(t,r)}})}}}),o("4",[],function(){return{register:function(n){n.addButton("nonbreaking",{title:"Nonbreaking space",cmd:"mceNonBreaking"}),n.addMenuItem("nonbreaking",{text:"Nonbreaking space",cmd:"mceNonBreaking",context:"insert"})}}}),o("0",["1","2","3","4"],function(n,e,t,r){return n.add("nonbreaking",function(n){e.register(n),r.register(n),t.setup(n)}),function(){}}),r("0")()}();