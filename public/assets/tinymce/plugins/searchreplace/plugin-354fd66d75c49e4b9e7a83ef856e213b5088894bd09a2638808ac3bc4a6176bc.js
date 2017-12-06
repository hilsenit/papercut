!function(){var e={},n=function(n){for(var t=e[n],a=t.deps,i=t.defn,o=a.length,d=new Array(o),c=0;c<o;++c)d[c]=r(a[c]);var u=i.apply(null,d);if(void 0===u)throw"module ["+n+"] returned undefined";t.instance=u},t=function(n,t,r){if("string"!=typeof n)throw"module id must be a string";if(void 0===t)throw"no dependencies for "+n;if(void 0===r)throw"no definition function for "+n;e[n]={deps:t,defn:r,instance:void 0}},r=function(t){var r=e[t];if(void 0===r)throw"module ["+t+"] was undefined";return void 0===r.instance&&n(t),r.instance},a=function(e,n){for(var t=e.length,a=new Array(t),i=0;i<t;++i)a[i]=r(e[i]);n.apply(null,a)};({}).bolt={module:{api:{define:t,require:a,demand:r}}};var i=t,o=function(e,n){i(e,[],function(){return n})};i("1",[],function(){var e=function(n){var t=n,r=function(){return t};return{get:r,set:function(e){t=e},clone:function(){return e(r())}}};return e}),o("6",tinymce.util.Tools.resolve),i("2",["6"],function(e){return e("tinymce.PluginManager")}),i("9",["6"],function(e){return e("tinymce.util.Tools")}),i("a",[],function(){function e(e){return e&&1===e.nodeType&&"false"===e.contentEditable}function n(n,t,r,a,i){function o(e,n){if(n=n||0,!e[0])throw"findAndReplaceDOMText cannot handle zero-length matches";var t=e.index;if(n>0){var r=e[n];if(!r)throw"Invalid capture group";t+=e[0].indexOf(r),e[0]=r}return[t,t+e[0].length,[e[0]]]}function d(n){var t;if(3===n.nodeType)return n.data;if(g[n.nodeName]&&!p[n.nodeName])return"";if(t="",e(n))return"\n";if((p[n.nodeName]||h[n.nodeName])&&(t+="\n"),n=n.firstChild)do{t+=d(n)}while(n=n.nextSibling);return t}function c(n,t,r){var a,i,o,d,c=[],u=0,l=n,s=t.shift(),f=0;e:for(;;){if((p[l.nodeName]||h[l.nodeName]||e(l))&&u++,3===l.nodeType&&(!i&&l.length+u>=s[1]?(i=l,d=s[1]-u):a&&c.push(l),!a&&l.length+u>s[0]&&(a=l,o=s[0]-u),u+=l.length),a&&i){if(l=r({startNode:a,startNodeIndex:o,endNode:i,endNodeIndex:d,innerNodes:c,match:s[2],matchIndex:f}),u-=i.length-d,a=null,i=null,c=[],s=t.shift(),f++,!s)break}else if(g[l.nodeName]&&!p[l.nodeName]||!l.firstChild){if(l.nextSibling){l=l.nextSibling;continue}}else if(!e(l)){l=l.firstChild;continue}for(;;){if(l.nextSibling){l=l.nextSibling;break}if(l.parentNode===n)break e;l=l.parentNode}}}function u(e){var n;if("function"!=typeof e){var t=e.nodeType?e:f.createElement(e);n=function(e,n){var r=t.cloneNode(!1);return r.setAttribute("data-mce-index",n),e&&r.appendChild(f.createTextNode(e)),r}}else n=e;return function(e){var t,r,a,i=e.startNode,o=e.endNode,d=e.matchIndex;if(i===o){var c=i;a=c.parentNode,e.startNodeIndex>0&&(t=f.createTextNode(c.data.substring(0,e.startNodeIndex)),a.insertBefore(t,c));var u=n(e.match[0],d);return a.insertBefore(u,c),e.endNodeIndex<c.length&&(r=f.createTextNode(c.data.substring(e.endNodeIndex)),a.insertBefore(r,c)),c.parentNode.removeChild(c),u}t=f.createTextNode(i.data.substring(0,e.startNodeIndex)),r=f.createTextNode(o.data.substring(e.endNodeIndex));for(var l=n(i.data.substring(e.startNodeIndex),d),s=[],p=0,g=e.innerNodes.length;p<g;++p){var h=e.innerNodes[p],m=n(h.data,d);h.parentNode.replaceChild(m,h),s.push(m)}var v=n(o.data.substring(0,e.endNodeIndex),d);return a=i.parentNode,a.insertBefore(t,i),a.insertBefore(l,i),a.removeChild(i),a=o.parentNode,a.insertBefore(v,o),a.insertBefore(r,o),a.removeChild(o),v}}var l,s,f,p,g,h,m=[],v=0;if(f=t.ownerDocument,p=i.getBlockElements(),g=i.getWhiteSpaceElements(),h=i.getShortEndedElements(),s=d(t)){if(n.global)for(;l=n.exec(s);)m.push(o(l,a));else l=s.match(n),m.push(o(l,a));return m.length&&(v=m.length,c(t,m,u(r))),v}}return{findAndReplaceDOMText:n}}),i("7",["9","a"],function(e,n){var t=function(e){var n=e.getAttribute("data-mce-index");return"number"==typeof n?""+n:n},r=function(e,t,r){var a,i;return i=e.dom.create("span",{"data-mce-bogus":1}),i.className="mce-match-marker",a=e.getBody(),p(e,t,!1),n.findAndReplaceDOMText(r,a,i,!1,e.schema)},a=function(e){var n=e.parentNode;e.firstChild&&n.insertBefore(e.firstChild,e),e.parentNode.removeChild(e)},i=function(n,r){var a,i=[];if(a=e.toArray(n.getBody().getElementsByTagName("span")),a.length)for(var o=0;o<a.length;o++){var d=t(a[o]);null!==d&&d.length&&d===r.toString()&&i.push(a[o])}return i},o=function(e,n,t){var r=n.get(),a=e.dom;t=!1!==t,t?r++:r--,a.removeClass(i(e,n.get()),"mce-match-marker-selected");var o=i(e,r);return o.length?(a.addClass(i(e,r),"mce-match-marker-selected"),e.selection.scrollIntoView(o[0]),r):-1},d=function(e,n){var t=n.parentNode;e.remove(n),e.isEmpty(t)&&e.remove(t)},c=function(e,n,t,a,i){t=t.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&"),t=t.replace(/\s/g,"\\s"),t=i?"\\b"+t+"\\b":t;var d=r(e,n,new RegExp(t,a?"g":"gi"));return d&&(n.set(-1),n.set(o(e,n,!0))),d},u=function(e,n){var t=o(e,n,!0);-1!==t&&n.set(t)},l=function(e,n){var t=o(e,n,!1);-1!==t&&n.set(t)},s=function(e){var n=t(e);return null!==n&&n.length>0},f=function(n,r,i,o,c){var f,p,m,v,x,b,N=r.get();for(o=!1!==o,m=n.getBody(),p=e.grep(e.toArray(m.getElementsByTagName("span")),s),f=0;f<p.length;f++){var y=t(p[f]);if(v=x=parseInt(y,10),c||v===r.get()){for(i.length?(p[f].firstChild.nodeValue=i,a(p[f])):d(n.dom,p[f]);p[++f];){if((v=parseInt(t(p[f]),10))!==x){f--;break}d(n.dom,p[f])}o&&N--}else x>r.get()&&p[f].setAttribute("data-mce-index",x-1)}return r.set(N),o?(b=g(n,r),u(n,r)):(b=h(n,r),l(n,r)),!c&&b},p=function(n,r,i){var o,d,c,u;for(d=e.toArray(n.getBody().getElementsByTagName("span")),o=0;o<d.length;o++){var l=t(d[o]);null!==l&&l.length&&(l===r.get().toString()&&(c||(c=d[o].firstChild),u=d[o].firstChild),a(d[o]))}if(c&&u){var s=n.dom.createRng();return s.setStart(c,0),s.setEnd(u,u.data.length),!1!==i&&n.selection.setRng(s),s}},g=function(e,n){return i(e,n.get()+1).length>0},h=function(e,n){return i(e,n.get()-1).length>0};return{done:p,find:c,next:u,prev:l,replace:f,hasNext:g,hasPrev:h}}),i("3",["7"],function(e){return{get:function(n,t){return{done:function(r){return e.done(n,t,r)},find:function(r,a,i){return e.find(n,t,r,a,i)},next:function(){return e.next(n,t)},prev:function(){return e.prev(n,t)},replace:function(r,a,i){return e.replace(n,t,r,a,i)}}}}}),i("8",["9","7"],function(e,n){return{open:function(t,r){function a(){c.statusbar.find("#next").disabled(!1===n.hasNext(t,r)),c.statusbar.find("#prev").disabled(!1===n.hasPrev(t,r))}function i(){t.windowManager.alert("Could not find the specified string.",function(){c.find("#find")[0].focus()})}var o,d={};t.undoManager.add(),o=e.trim(t.selection.getContent({format:"text"}));var c=t.windowManager.open({layout:"flex",pack:"center",align:"center",onClose:function(){t.focus(),n.done(t,r),t.undoManager.add()},onSubmit:function(e){var o,u,l,s;return e.preventDefault(),u=c.find("#case").checked(),s=c.find("#words").checked(),l=c.find("#find").value(),l.length?d.text===l&&d.caseState===u&&d.wholeWord===s?n.hasNext(t,r)?(n.next(t,r),void a()):void i():(o=n.find(t,r,l,u,s),o||i(),c.statusbar.items().slice(1).disabled(0===o),a(),void(d={text:l,caseState:u,wholeWord:s})):(n.done(t,r,!1),void c.statusbar.items().slice(1).disabled(!0))},buttons:[{text:"Find",subtype:"primary",onclick:function(){c.submit()}},{text:"Replace",disabled:!0,onclick:function(){n.replace(t,r,c.find("#replace").value())||(c.statusbar.items().slice(1).disabled(!0),r.set(-1),d={})}},{text:"Replace all",disabled:!0,onclick:function(){n.replace(t,r,c.find("#replace").value(),!0,!0),c.statusbar.items().slice(1).disabled(!0),d={}}},{type:"spacer",flex:1},{text:"Prev",name:"prev",disabled:!0,onclick:function(){n.prev(t,r),a()}},{text:"Next",name:"next",disabled:!0,onclick:function(){n.next(t,r),a()}}],title:"Find and replace",items:{type:"form",padding:20,labelGap:30,spacing:10,items:[{type:"textbox",name:"find",size:40,label:"Find",value:o},{type:"textbox",name:"replace",size:40,label:"Replace with"},{type:"checkbox",name:"case",text:"Match case",label:" "},{type:"checkbox",name:"words",text:"Whole words",label:" "}]}})}}}),i("4",["8"],function(e){return{register:function(n,t){n.addCommand("SearchReplace",function(){e.open(n,t)})}}}),i("5",["8"],function(e){var n=function(n,t){return function(){e.open(n,t)}};return{register:function(e,t){e.addMenuItem("searchreplace",{text:"Find and replace",shortcut:"Meta+F",onclick:n(e,t),separator:"before",context:"edit"}),e.addButton("searchreplace",{tooltip:"Find and replace",onclick:n(e,t)}),e.shortcuts.add("Meta+F","",n(e,t))}}}),i("0",["1","2","3","4","5"],function(e,n,t,r,a){return n.add("searchreplace",function(n){var i=e(-1);return r.register(n,i),a.register(n,i),t.get(n,i)}),function(){}}),r("0")()}();