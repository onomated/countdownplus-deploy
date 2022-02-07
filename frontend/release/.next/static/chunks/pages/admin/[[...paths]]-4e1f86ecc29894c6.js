(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[831],{18936:function(e,t,r){"use strict";r.d(t,{Z:function(){return p}});r(9405);var n,o=r(89552),c=r(4283),i=r.n(c),l=r(71383),a=r(13043),s=r.n(a)().div(n||(n=(0,l.Z)(["\n  flex\n  flex-col\n  content-center\n  items-center\n  justify-center\n  text-center\n  px-12\n  py-8\n  mx-0\n  my-4\n"]))),u=r(85893),f=function(){return(0,u.jsx)(s,{children:(0,u.jsx)(o.Z,{size:"large"})})},p=function(e){var t=e.showTopProgress,r=void 0===t||t,n=e.showContentProgress,o=void 0===n||n;return(0,u.jsxs)(u.Fragment,{children:[r&&(0,u.jsx)(i(),{}),o&&(0,u.jsx)(f,{})]})}},59464:function(e,t,r){"use strict";var n=r(59499),o=(r(82815),r(84960)),c=(r(47811),r(91633)),i=r(4730),l=r(67294),a=r(85893),s=["user","size"];function u(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function f(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?u(Object(r),!0).forEach((function(t){(0,n.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):u(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}t.Z=function(e){var t=e.user,r=e.size,n=(0,i.Z)(e,s),u=(0,l.useState)(!1),p=u[0],d=u[1],O=function(e){if(e&&Number.isInteger(e))return e;switch(e){case"xs":return 32;case"sm":return 40;case"lg":return 88;case"xl":return 100;default:return 58}}(r),j=null===t||void 0===t?void 0:t.avatarLetters,b={backgroundColor:null||"var(--primary-color)"};b.fontSize="".concat(Math.floor(O/2),"px");var y=void 0;return null!==t&&void 0!==t&&t.avatarUrl&&!p&&(y=(0,a.jsx)(c.Z,{alt:"".concat(t.username," profile image"),src:t.avatarUrl,width:O,preview:!1,onError:function(){d(!0)}})),(0,a.jsx)(o.ZP,f(f({className:"flex-none",src:y,style:b,size:O},n),{},{children:j}))}},58902:function(e,t,r){"use strict";r.r(t),r.d(t,{default:function(){return en}});var n=r(4730),o=r(5152),c=r(11163),i=r(65386),l=r(71217),a=r(18936),s=r(96650),u=r(85893),f=(0,l.Pi)((function(e){var t=e.children,r=e.redirectTo,n=(0,s.oR)("session"),o=(0,c.useRouter)();if(n.isLoading)return(0,u.jsx)(a.Z,{});if(!n.userCanAdmin){var i=r||"/";return o.replace(i).then((function(){console.warn("Ensure admin blocked. Redirect to ".concat(i))})),null}return(0,u.jsx)(u.Fragment,{children:t})})),p=function(){return(0,u.jsx)("div",{children:"Dashboard"})},d=function(){return(0,u.jsx)("div",{children:"Events Details"})},O=function(){return(0,u.jsx)("div",{children:"Events"})},j=function(){return(0,u.jsx)("div",{children:"Groups Details"})},b=function(){return(0,u.jsx)("div",{children:"Groups"})},y=function(){return(0,u.jsx)("div",{children:"Invalid Admin Link"})},h=r(62251),v=r(61956),g=function(e){var t=e.path,r="".concat(v.Z.api.baseUrl).concat(t);return(0,u.jsx)(h.Z,{url:r,height:"100%",width:"100%"})},m=function(){return(0,u.jsx)(g,{path:"/workers"})},x=function(){return(0,u.jsx)(g,{path:"/monitor"})},P=function(e){var t=e.path,r=e.queryParams;return(0,u.jsxs)("div",{children:["Users Details with paths: ",(0,u.jsx)("span",{children:t.toString()})," and query params:"," ",(0,u.jsx)("span",{children:r.toString()})]})},w=r(59499),S=(r(92015),r(4863)),Z=(r(30467),r(55673)),D=(r(58136),r(5789)),C=(r(44230),r(20838)),E=r(67294),k=(r(1025),r(65400)),F=r(50888),T=r(80651),A=function(e){var t=e.children,r=e.leftIconComponent,n=e.rightIconComponent;return(0,u.jsxs)("div",{className:"flex items-center -mt-1",children:[r?(0,u.jsx)(r,{className:"pt-1 mr-1"}):null,t,n?(0,u.jsx)(n,{className:"pt-1 ml-1"}):null]})},N=["loadMore","isLoading","canLoadMore"];function U(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function I(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?U(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):U(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var _,q=function(e){var t=e.loadMore,r=e.isLoading,o=e.canLoadMore,c=(0,n.Z)(e,N);return(0,u.jsx)(k.default,I(I({type:"text",onClick:t},c),{},{children:r?(0,u.jsx)(A,{rightIconComponent:F.Z,children:"Loading more..."}):o?(0,u.jsx)(A,{rightIconComponent:T.Z,children:"Load more"}):null}))},L=(r(56120),r(74253)),M=(r(48145),r(40987)),R=(r(58344),r(60171)),z=r(16835),B=function(e){var t=e.object;return(0,u.jsx)("pre",{children:JSON.stringify(t,null,2)})},V=function(e){var t=e.label,r=e.value;return(0,u.jsxs)("span",{children:[t&&(0,u.jsx)("span",{className:"font-bold",children:"".concat(t,": ")}),JSON.stringify(r)]})},$=function(e){return!((0,i.Kn)(e)||Array.isArray(e))},G=function(e,t,r){var n=(0,z.Z)(e,2),o=n[0],c=n[1];return $(c)?{key:"".concat(r,"-").concat(t,"-").concat(o),title:(0,u.jsx)(V,{label:o,value:c})}:{key:"".concat(r,"-").concat(t,"-").concat(o),title:o,children:X(c,r+1)}},J=function(e,t,r){return $(e)?{key:"".concat(r,"-").concat(t),title:(0,u.jsx)(V,{label:"[".concat(t,"]"),value:e})}:{key:"".concat(r,"-").concat(t),title:"".concat(t),children:X(e,r+1)}},K=function(e,t){return{key:"".concat(t,"-").concat(e),title:(0,u.jsx)(V,{value:e})}},X=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:0;return Array.isArray(e)?e.map((function(e,t,r){return J(e,t,r)})):(0,i.Kn)(e)?Object.entries(e).map((function(e,r){return G(e,r,t)})):K(e,t)},H=function(e){var t=e.object,r=X(t);return(0,u.jsx)(R.Z,{treeData:r})},Q=function(e){var t=e.object,r=(0,E.useState)(!1),n=r[0],o=r[1],c=n?H:B;return(0,u.jsxs)("div",{children:[(0,u.jsxs)("div",{className:"flex justify-end px-4",children:[(0,u.jsx)("div",{children:"Plain"}),(0,u.jsx)(M.Z,{className:"mx-2",checked:n,onChange:function(e){return o(e)}}),(0,u.jsx)("div",{children:"Tree"})]}),(0,u.jsx)(L.Z,{}),(0,u.jsx)(c,{object:t})]})},W=r(71383),Y=r(13043),ee=r.n(Y),te=r(26024),re=(r(6373),r(82891)),ne=function(e){var t=e.iconComponent,r=e.children,n=e.overlay;return(0,u.jsx)(re.Z,{arrow:!0,overlay:n,children:(0,u.jsx)(k.default,{type:"text",size:"small",onClick:function(e){return e.preventDefault()},children:(0,u.jsx)(A,{leftIconComponent:t,children:r})})})},oe=(r(23461),r(53740)),ce=oe.Z.Title,ie=ee().div(_||(_=(0,W.Z)(["\n  bg-white\n  p-4\n  shadow-md\n"]))),le=function(e){var t=e.title,r=e.children,n=e.applyDisabled,o=e.onApply,c=e.onCancel;return(0,u.jsxs)(ie,{children:[(0,u.jsx)(ce,{level:5,children:t}),(0,u.jsxs)("div",{className:"flex flex-col",children:[r?(0,u.jsx)("div",{className:"flex flex-row",children:r}):null,o||c?(0,u.jsxs)("div",{className:"flex flex-row justify-end mt-40",children:[o?(0,u.jsx)(k.default,{type:"primary",onClick:o,disabled:n,children:"Apply"}):null,c?(0,u.jsx)(k.default,{className:"ml-2",onClick:c,children:"Cancel"}):null]}):null]})]})},ae=(r(35797),r(64749)),se=r(22062),ue=["fieldSpec"];function fe(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function pe(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?fe(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):fe(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var de=ae.Z.Option,Oe=function(e){var t=e.fieldSpec,r=(0,n.Z)(e,ue);return(0,u.jsx)(ae.Z,pe(pe({className:"w-40 mr-2"},r),{},{children:t.map((function(e){var t=e.field,r=e.title;return(0,u.jsx)(de,{value:t,children:r||(0,se.O)(t)},t)}))}))},je=function(){return(0,u.jsx)(ae.Z.Option,{value:"eq",children:"Equal"})},be=function(){return(0,u.jsx)(ae.Z.Option,{value:"gt",children:"Greater Than"})},ye=function(){return(0,u.jsx)(ae.Z.Option,{value:"ge",children:"Greater Than or Equal"})},he=function(){return(0,u.jsx)(ae.Z.Option,{value:"lt",children:"Less Than"})},ve=function(){return(0,u.jsx)(ae.Z.Option,{value:"le",children:"Less Than or Equal"})},ge=function(){return(0,u.jsx)(ae.Z.Option,{value:"ne",children:"Not Equal"})};function me(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function xe(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?me(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):me(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Pe=function(e){return(0,u.jsxs)(ae.Z,xe(xe({},e),{},{children:[je(),ge(),be(),ye(),he(),ve()]}))};function we(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Se(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?we(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):we(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Ze=function(e){return(0,u.jsxs)(ae.Z,Se(Se({},e),{},{children:[je(),ge()]}))};function De(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Ce(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?De(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):De(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Ee=function(e){return(0,u.jsxs)(ae.Z,Ce(Ce({},e),{},{children:[je(),ge(),be(),ye(),he(),ve()]}))};function ke(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Fe(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?ke(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):ke(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Te=function(e){return(0,u.jsxs)(ae.Z,Fe(Fe({},e),{},{children:[je(),ge()]}))},Ae=["fieldSpec"];function Ne(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Ue(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Ne(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Ne(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Ie=function(e){var t=e.fieldSpec,r=Ue(Ue({},(0,n.Z)(e,Ae)),t),o=function(e){switch(e){case"string":return Te;case"numeric":return Ee;case"enum":return Ze;case"dateTime":return Pe;default:return null}}(null===t||void 0===t?void 0:t.type);return o?(0,u.jsx)(o,Ue({},r)):null},_e=["value","onChange"];function qe(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var Le=function(e){var t=e.value,r=e.onChange,o=(0,n.Z)(e,_e);return(0,u.jsx)(M.Z,function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?qe(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):qe(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({checked:t,onChange:r},o))},Me=(r(62713),r(14321)),Re=["value","onChange"];function ze(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var Be=function(e){e.value;var t=e.onChange,r=(0,n.Z)(e,Re);return(0,u.jsx)(Me.Z,function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?ze(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):ze(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({showTime:!0,onOk:function(e,r){t(e.toISOString())}},r))},Ve=["value","onChange","values"];function $e(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Ge(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?$e(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):$e(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Je=ae.Z.Option,Ke=function(e){var t=e.value,r=e.onChange,o=e.values,c=(0,n.Z)(e,Ve);return(0,u.jsx)(ae.Z,Ge(Ge({className:"w-32",defaultValue:t,onChange:r},c),{},{children:o.map((function(e){return(0,u.jsx)(Je,{value:e,children:(0,se.O)(e.toLowerCase(),{capitalizeFirst:!0})},e)}))}))},Xe=(r(59567),r(8799)),He=["value","onChange"];function Qe(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var We=function(e){var t=e.value,r=e.onChange,o=(0,n.Z)(e,He);return(0,u.jsx)(Xe.Z,function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Qe(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Qe(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({value:t,onChange:r},o))},Ye=(r(89858),r(51024)),et=["value","onChange"];function tt(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function rt(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?tt(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):tt(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var nt=function(e){var t=e.value,r=e.onChange,o=(0,n.Z)(e,et);return(0,u.jsx)(Ye.Z,rt(rt({className:"w-40",onChange:function(e){return r(e.target.value)}},o),{},{value:t}))},ot=["fieldSpec"];function ct(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function it(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?ct(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):ct(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var lt,at,st=function(e){var t=e.fieldSpec,r=it(it({},(0,n.Z)(e,ot)),t),o=function(e){switch(e){case"string":return nt;case"number":return We;case"boolean":return Le;case"dateTime":return Be;case"enum":return Ke;default:return null}}(null===t||void 0===t?void 0:t.type);return o?(0,u.jsx)(o,it({},r)):null},ut=function(e){var t=e.filter,r=e.filterSpec,n=e.entityTitle,o=e.onUpdateFilter,c=(0,E.useState)(void 0),i=c[0],l=c[1],a=(0,E.useState)(void 0),s=a[0],f=a[1],p=(0,E.useState)(void 0),d=p[0],O=p[1],j=(0,E.useMemo)((function(){var e;return d||(null===(e=t[i])||void 0===e?void 0:e[s])}),[i,t,s,d]),b=(0,E.useMemo)((function(){return r.find((function(e){return e.field===i}))}),[i,r]);return(0,u.jsxs)(le,{title:"Filter ".concat(n),applyDisabled:!(i&&s&&d),onApply:function(){o(i,s,d)},children:[(0,u.jsx)(Oe,{fieldSpec:r,defaultValue:i,placeholder:"Select filter field",onChange:l}),(0,u.jsx)(Ie,{className:"w-32 mr-2",fieldSpec:b,onChange:f}),(0,u.jsx)(st,{value:j,fieldSpec:b,onChange:O})]})},ft=function(e){var t=e.scopeSpec,r=e.entityTitle,n=e.filter,o=e.updateFilterOp;return(0,u.jsx)(ne,{iconComponent:te.Z,overlay:(0,u.jsx)(ut,{entityTitle:r,filter:n,filterSpec:t.filter,onUpdateFilter:function(e,t,r){o({field:e,operator:t,value:r})}}),children:"Filter"})},pt=r(77171),dt=r(1912),Ot=function(e){return Object.entries(e).map((function(e){var t=(0,z.Z)(e,2),r=t[0],n=t[1],o=n.direction;n.ordinal;return{field:r,direction:o}}))},jt=function(e){switch(e){case"eq":return"=";case"ne":return"!=";case"gt":return">";case"ge":return">=";case"lt":return"<";case"le":return"<=";case"in":return"one of";case"not_in":return"not one of";default:return(0,se.O)(e)}},bt=function(e){return JSON.stringify(e)},yt=(r(77785),r(59361)),ht=ee()(yt.default)(lt||(lt=(0,W.Z)(["\nflex\nflex-row\nitems-center\n"]))),vt=["field","operator","value"],gt=["field","direction"];function mt(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function xt(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?mt(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):mt(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Pt=ee().div(at||(at=(0,W.Z)(["\n  flex\n  flex-row\n  items-center\n  py-2\n"]))),wt=function(e){var t=e.field,r=e.operator,o=e.value,c=(0,n.Z)(e,vt);return(0,u.jsx)(ht,xt(xt({color:"green",closable:!0},c),{},{children:"".concat((0,se.O)(t)," ").concat(jt(r||"eq")," ").concat(bt(o))}))},St=function(e){var t=e.field,r=e.direction,o=(0,n.Z)(e,gt),c="DESC"===r?(0,u.jsx)(pt.Z,{}):(0,u.jsx)(dt.Z,{});return(0,u.jsx)(ht,xt(xt({icon:c,color:"blue",closable:!0},o),{},{children:"".concat((0,se.O)(t)," ")}))},Zt=function(e){var t=e.filter,r=e.deleteFilterOp,n=e.sort,o=e.deleteSort,c=(0,E.useMemo)((function(){return function(e){return Object.entries(e).flatMap((function(t){var r=(0,z.Z)(t,2),n=r[0],o=r[1];return"search"===n?[{field:n,value:e.search}]:Object.entries(o).map((function(e){var t=(0,z.Z)(e,2),r=t[0],o=t[1];return{field:n,operator:r,value:o}}))}))}(t)}),[t]),i=(0,E.useMemo)((function(){return Ot(n)}),[n]);return c.length||i.length?(0,u.jsxs)(Pt,{children:[c.map((function(e){var t=e.field,n=e.operator,o=e.value;return(0,u.jsx)(wt,{field:t,operator:n,value:o,onClose:function(){r({field:t,operator:n})}},"".concat(t,"-").concat(n,"-").concat(o))})),i.map((function(e){var t=e.field,r=e.direction;return(0,u.jsx)(St,{field:t,direction:r,onClose:function(){o({field:t})}},"".concat(t,"-").concat(r))}))]}):null},Dt=r(68795),Ct=Ye.Z.Search,Et=function(e){var t=e.searchTerm,r=e.entityTitle,n=e.onUpdateSearch;return(0,u.jsx)(le,{title:"Search ".concat(r),children:(0,u.jsx)(Ct,{placeholder:"Input search term",defaultValue:t,allowClear:!0,enterButton:!0,onSearch:n})})},kt=function(e){var t=e.entityTitle,r=e.filter,n=e.updateFilterOp,o=e.deleteFilterOp;return(0,u.jsx)(ne,{iconComponent:Dt.Z,overlay:(0,u.jsx)(Et,{searchTerm:r.search,entityTitle:t,onUpdateSearch:function(e){null!==e&&void 0!==e&&e.length?null===n||void 0===n||n({field:"search",value:e}):null===o||void 0===o||o({field:"search"})}}),children:"Search"})},Ft=r(29965),Tt=["direction"];function At(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Nt(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?At(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):At(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Ut,It,_t,qt=ae.Z.Option,Lt=function(e){e.direction;var t=(0,n.Z)(e,Tt);return(0,u.jsxs)(ae.Z,Nt(Nt({className:"w-32"},t),{},{children:[(0,u.jsx)(qt,{value:"ASC",children:"Ascending"}),(0,u.jsx)(qt,{value:"DESC",children:"Descending"})]}))},Mt=function(e){var t,r,n=e.sort,o=e.sortSpec,c=e.entityTitle,i=e.onUpdateSort,l=(0,E.useMemo)((function(){return Ot(n)}),[n]),a=(0,E.useState)(null===(t=l[0])||void 0===t?void 0:t.field),s=a[0],f=a[1],p=(0,E.useState)(null===(r=l[0])||void 0===r?void 0:r.direction),d=p[0],O=p[1];return(0,u.jsxs)(le,{title:"Sort ".concat(c),onApply:function(){return i(s,d)},children:[(0,u.jsx)(Oe,{fieldSpec:o,defaultValue:s,placeholder:"Select sort field",onChange:f}),(0,u.jsx)(Lt,{defaultValue:d||"ASC",onChange:O})]})},Rt=function(e){var t=e.scopeSpec,r=e.entityTitle,n=e.sort,o=e.updateSort;return(0,u.jsx)(ne,{iconComponent:Ft.Z,overlay:(0,u.jsx)(Mt,{entityTitle:r,sort:n,sortSpec:t.sort,onUpdateSort:function(e,t){o({field:e,direction:t})}}),children:"Sort"})},zt=ee().div(Ut||(Ut=(0,W.Z)(["\n  flex\n  flex-col\n  py-4\n"]))),Bt=ee().div(It||(It=(0,W.Z)(["\n  flex\n  flex-row\n  justify-between\n  items-center\n"]))),Vt=ee().div(_t||(_t=(0,W.Z)(["\n  flex\n  flex-row\n  items-center\n"]))),$t=function(e){var t,r,n=e.scopeSpec,o=e.filter,c=e.updateFilterOp,i=e.deleteFilterOp,l=e.sort,a=e.updateSort,s=e.deleteSort,f=e.totalCount,p=e.entityTitle,d=void 0===p?"Records":p;return(0,u.jsxs)(zt,{children:[(0,u.jsxs)(Bt,{children:[(0,u.jsx)(Vt,{children:"Displaying ".concat(f," ").concat(d)}),(0,u.jsxs)(Vt,{children:[n.searchable?(0,u.jsx)(kt,{entityTitle:d,filter:o,updateFilterOp:c,deleteFilterOp:i}):null,null!==(t=n.filter)&&void 0!==t&&t.length?(0,u.jsx)(ft,{scopeSpec:n,entityTitle:d,filter:o,updateFilterOp:c}):null,null!==(r=n.sort)&&void 0!==r&&r.length?(0,u.jsx)(Rt,{scopeSpec:n,entityTitle:d,sort:l,updateSort:a}):null]})]}),(0,u.jsx)(Zt,{filter:o,deleteFilterOp:i,sort:l,deleteSort:s})]})},Gt=r(87379),Jt=r(63606),Kt=r(47399),Xt=["children","connected"];function Ht(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Qt(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Ht(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Ht(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Wt,Yt,er,tr,rr,nr=(0,Gt.ZP)(k.default).withConfig({displayName:"ConnectButton__StyledButton",componentId:"sc-6hiqsi-0"})(["flex:none;&.ant-btn-sm{padding-left:calc(var(--btn-height-sm) * 0.333);padding-right:calc(var(--btn-height-sm) * 0.333);}"]),or=(0,Gt.ZP)(nr).withConfig({displayName:"ConnectButton__BlockButton",componentId:"sc-6hiqsi-1"})(["background-color:var(--action-color);border-color:var(--action-color);&:active{background-color:var(--action-color-active);border-color:var(--action-color-active);}&:hover,&:focus{background-color:var(--action-color-hover);border-color:var(--action-color-hover);}"]),cr=function(e){var t=e.children,r=e.connected,o=(0,n.Z)(e,Xt),c=r?{type:"link"}:{type:"primary",shape:"round"},i=Qt(Qt(Qt({},{size:"small"}),o),c),l=r?nr:or,a=r?Jt.Z:Kt.Z;return(0,u.jsx)(l,Qt(Qt({},i),{},{children:(0,u.jsx)(A,{leftIconComponent:a,children:t})}))},ir=r(59464),lr=oe.Z.Text,ar=Gt.ZP.div.withConfig({displayName:"UserCard__Container",componentId:"sc-agsmxp-0"})(["width:100%;display:flex;flex-direction:column;padding:1rem;border-width:1px;border-radius:0.5rem;background-color:white;filter:drop-shadow(0 4px 8px rgba(236,236,236,0.5));"]),sr=ee().div(Wt||(Wt=(0,W.Z)(["\n  flex\n  flex-row\n  items-center\n  w-full\n"]))),ur=ee().div(Yt||(Yt=(0,W.Z)(["\n  flex\n  flex-col\n  grow\n  min-w-0\n  px-2\n"]))),fr=ee()(lr)(er||(er=(0,W.Z)(["\n  font-bold\n"]))),pr=ee()(lr)(tr||(tr=(0,W.Z)(["\n  text-sm\n"]))),dr=ee().div(rr||(rr=(0,W.Z)(["\n  flex\n  flex-col\n  w-full\n  text-sm\n"]))),Or=function(e){var t=e.user,r=e.admin;return(0,u.jsxs)(ar,{children:[(0,u.jsxs)(sr,{children:[(0,u.jsx)(ir.Z,{user:t}),(0,u.jsxs)(ur,{children:[(0,u.jsxs)(fr,{ellipsis:{tooltip:t.username},children:["@",t.username]}),t.followerCount?(0,u.jsxs)(pr,{ellipsis:!0,children:[t.followerCount," Followers"]}):null]}),(0,u.jsx)(cr,{connected:!1,children:"Follow"})]}),r?(0,u.jsxs)(dr,{children:[(0,u.jsx)(L.Z,{}),(0,u.jsxs)("div",{children:[t.name," \xa0 ",t.pronounSymbol," \xa0 ",t.countryFlagEmoji]}),t.dob?(0,u.jsxs)("div",{children:["\ud83c\udf82 \xa0 ",t.birthday," \xa0 (",t.age,")"]}):null,t.lastSeenAt?(0,u.jsxs)("div",{children:["Last seen on ",t.lastSeenDateText]}):null]}):null]})},jr=r(20871),br=r(28687),yr=["search"];function hr(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function vr(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?hr(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):hr(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var gr,mr,xr,Pr,wr,Sr=function(e,t){var r=t.field,o=t.operator,c=t.value;if("search"===r){if(c)return vr(vr({},e),{},{search:c});e.search;return(0,n.Z)(e,yr)}if(!o)return e;var i=e[r]||{};return void 0===c?delete i[o]:i[o]=c,vr(vr({},e),{},(0,w.Z)({},r,i))},Zr=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},t=(0,E.useReducer)(Sr,e),r=t[0],n=t[1],o=function(e){return n(e)},c=function(e){var t=e.field,r=e.operator;return n({field:t,operator:r,value:void 0})};return{filter:r,updateFilterOp:o,deleteFilterOp:c}},Dr=function(e,t){var r=t.field,n=t.direction,o=t.ordinal,c=void 0===o?0:o;return void 0===r||void 0===n?{}:(0,w.Z)({},r,{direction:n,ordinal:c})},Cr=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},t=(0,E.useReducer)(Dr,e),r=t[0],n=t[1],o=function(e){return n(e)},c=function(e){return n(e)};return{sort:r,updateSort:o,deleteSort:c}},Er=r(35235),kr=(0,br.gql)(gr||(gr=(0,W.Z)(["\n  fragment ThumbnailAttachmentFields on Attachment {\n    thumbnailAsset {\n      url\n    }\n  }\n"]))),Fr=(0,br.gql)(mr||(mr=(0,W.Z)(["\n  ","\n  fragment AvatarOnlyAttachmentFields on Attachment {\n    id\n    ...ThumbnailAttachmentFields\n  }\n"])),kr),Tr={pageInfoFields:(0,br.gql)(xr||(xr=(0,W.Z)(["\n  fragment PageInfoFields on PageInfo {\n    startCursor\n    endCursor\n    itemCount\n    hasNextPage\n    hasPreviousPage\n  }\n"]))),thumbnailAssetFields:kr,avatarOnlyAttachmentFields:Fr};function Ar(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var Nr,Ur=(0,br.gql)(Pr||(Pr=(0,W.Z)(["\n  fragment UserFields on User {\n    id\n    accountType\n    firstName\n    lastName\n    dob\n    pronoun\n    countryCode\n    lastSeenAt\n    username\n    followerCount\n    userAttachments {\n      nodes {\n        profileAttachmentType\n        attachment {\n          thumbnailAsset {\n            url\n          }\n        }\n      }\n    }\n  }\n"]))),Ir=function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Ar(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Ar(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({userSummaryFields:Ur,userConnectionFields:(0,br.gql)(wr||(wr=(0,W.Z)(["\n  ","\n  ","\n  fragment UserConnectionFields on UserConnection {\n    pageInfo {\n      ...PageInfoFields\n    }\n    nodes {\n      ...UserFields\n    }\n  }\n"])),Tr.pageInfoFields,Ur)},Tr);function _r(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function qr(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?_r(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):_r(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Lr=(0,br.gql)(Nr||(Nr=(0,W.Z)(["\n  ","\n  query UsersList(\n    $filter: UserFilter\n    $paginate: PaginationInput\n    $sort: UserSort\n  ) {\n    listUsers(filter: $filter, paginate: $paginate, sort: $sort) {\n      ...UserConnectionFields\n    }\n  }\n"])),Ir.userConnectionFields);function Mr(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Rr(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Mr(Object(r),!0).forEach((function(t){(0,w.Z)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Mr(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var zr={searchable:!0,filter:[{field:"email",type:"string"},{field:"username",type:"string"},{field:"accountType",type:"enum",values:["ADMIN","STAFF","USER","VISITOR"]},{field:"lastSeenAt",type:"dateTime",title:"Last seen"},{field:"updatedAt",type:"dateTime"}],sort:[{field:"score"},{field:"lastSeenAt"},{field:"updatedAt"}]},Br=C.Z.TabPane,Vr=function(e){var t=e.data,r=e.filter,n=e.updateFilterOp,o=e.deleteFilterOp,c=e.sort,i=e.updateSort,l=e.deleteSort,s=e.totalCount,f=e.fetchNextPage,p=e.hasNextPage,d=e.isFetching,O=e.isFetchingNextPage;return(0,u.jsxs)(u.Fragment,{children:[(0,u.jsx)($t,{entityTitle:"Users",scopeSpec:zr,filter:r,updateFilterOp:n,deleteFilterOp:o,sort:c,updateSort:i,deleteSort:l,totalCount:s}),(0,u.jsx)(Z.Z,{gutter:[16,16],children:t.pages.map((function(e,t){return(0,u.jsx)(E.Fragment,{children:jr.Z.wrap(e.nodes,{observable:!1}).map((function(e){return(0,u.jsx)(D.Z,{sm:24,lg:12,xl:8,xxl:6,children:(0,u.jsx)(Or,{user:e,admin:!0})},e.id)}))},t)}))}),(0,u.jsx)("div",{className:"flex justify-center py-6",children:(0,u.jsx)(q,{loadMore:function(){return f()},isLoading:O,canLoadMore:p,disabled:!p||O})}),d?(0,u.jsx)(a.Z,{showContentProgress:!1}):null]})},$r=function(){var e=function(){var e=Zr({}),t=e.filter,r=Cr({lastSeenAt:{direction:"DESC",ordinal:0}}),n=r.sort,o=(0,Er.CF)(Lr,{dataKey:"listUsers",variables:{filter:t,sort:n}});return qr(qr(qr({},e),r),o)}(),t=e.status,r=e.data,n=e.error,o=e.reset;return"loading"===t?(0,u.jsx)(a.Z,{}):"error"===t?(0,u.jsx)(S.default,{message:"Error Fetching users in",description:JSON.stringify(n),type:"error",closable:!0,onClose:o}):(0,u.jsxs)(C.Z,{children:[(0,u.jsx)(Br,{tab:"Data",children:(0,u.jsx)(Vr,Rr({},e))},"data"),(0,u.jsx)(Br,{tab:"Debug",children:(0,u.jsx)(Q,{object:r})},"debug")]})},Gr=function(){return(0,u.jsx)("div",{children:"Merge Users"})},Jr=(0,l.Pi)((function(e){var t=e.children,r=(0,s.oR)("session"),n=(0,Er.Rx)(),o=r.token;return o&&n.setHeader("authorization","Bearer ".concat(o)),(0,u.jsx)(u.Fragment,{children:t})})),Kr=["paths"],Xr=(0,o.default)((function(){return Promise.all([r.e(662),r.e(21),r.e(253)]).then(r.bind(r,253))}),{ssr:!1,loadableGenerated:{webpack:function(){return[253]}}}),Hr=function(e,t){return Array.isArray(e)&&Array.isArray(t)?e.length===t.length&&e.every((function(e,r){var n=t[r];return(0,i.HD)(n)?e===t[r]:e.match(n)})):void 0===e&&void 0===t},Qr=function(e,t){return{component:e,key:Array.isArray(t)?"".concat(t.join("_"),"_page"):t}},Wr=/[\w_-]*/,Yr=function(){var e,t=(0,c.useRouter)().query,r=t.paths,o=(0,n.Z)(t,Kr),i=Hr(e=r,void 0)?Qr(p,"dashboard_page"):Hr(e,["users"])?Qr($r,e):Hr(e,["users","merge"])?Qr(Gr,e):Hr(e,["users",Wr])?Qr(P):Hr(e,["events"])?Qr(O,e):Hr(e,["events",Wr])?Qr(d):Hr(e,["groups"])?Qr(b,e):Hr(e,["groups",Wr])?Qr(j):Hr(e,["background-jobs"])?Qr(m,e):Hr(e,["monitor"])?Qr(x,e):Qr(y),l=i.component,a=i.key;return(0,u.jsx)(f,{children:(0,u.jsx)(Er.XR,{children:(0,u.jsx)(Jr,{children:(0,u.jsx)(Xr,{selectedMenuKey:a,children:(0,u.jsx)(l,{path:r,queryParams:o})})})})})},en=function(){return(0,u.jsx)(Yr,{})}},17913:function(e,t,r){(window.__NEXT_P=window.__NEXT_P||[]).push(["/admin/[[...paths]]",function(){return r(58902)}])}},function(e){e.O(0,[774,885,768,554,369,888,179],(function(){return t=17913,e(e.s=t);var t}));var t=e.O();_N_E=t}]);