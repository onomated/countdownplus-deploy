(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[459],{18936:function(e,n,r){"use strict";r.d(n,{Z:function(){return p}});r(9405);var t,s=r(89552),o=r(4283),i=r.n(o),a=r(71383),c=r(13043),l=r.n(c)().div(t||(t=(0,a.Z)(["\n  flex\n  flex-col\n  content-center\n  items-center\n  justify-center\n  text-center\n  px-12\n  py-8\n  mx-0\n  my-4\n"]))),u=r(85893),d=function(){return(0,u.jsx)(l,{children:(0,u.jsx)(s.Z,{size:"large"})})},p=function(e){var n=e.showTopProgress,r=void 0===n||n,t=e.showContentProgress,s=void 0===t||t;return(0,u.jsxs)(u.Fragment,{children:[r&&(0,u.jsx)(i(),{}),s&&(0,u.jsx)(d,{})]})}},56257:function(e,n,r){"use strict";r.r(n),r.d(n,{default:function(){return xe}});r(29809);var t,s,o,i,a,c=r(97538),l=(r(89858),r(51024)),u=(r(92015),r(4863)),d=(r(75314),r(11187)),p=r(50029),x=(r(56120),r(74253)),f=(r(1025),r(65400)),h=r(71383),m=(r(23461),r(53740)),g=r(87794),j=r.n(g),v=r(62307),y=r(12245),w=r(71217),Z=r(11163),b=r(13043),P=r.n(b),O=r(64094),_=r(18936),T=r(96650),N=(r(30467),r(55673)),E=(r(58136),r(5789)),k=r(25675),C=r(85893),I=function(e){var n=e.href,r=e.alt,t=e.src;return(0,C.jsx)(O.Z,{href:n,wrap:!0,children:(0,C.jsx)(k.default,{alt:r,src:t,width:140,height:48})})},L=function(e){switch(e.store){case"appstore":return(0,C.jsx)(I,{href:"https://itunes.apple.com/us/app/countdown+-event-reminders/id566237798?ls=1&mt=8&utm_campaign=home-header&utm_medium=website&utm_source=countdownplus",alt:"Download Countdown+ on the App Store",src:"/btn-appstore.png"});case"google_play":return(0,C.jsx)(I,{href:"https://play.google.com/store/apps/details?id=com.appsbeyond.countdownplus.lite&utm_campaign=home-header&utm_medium=website&utm_source=countdownplusevents",alt:"Download Countdown+ on Google Play",src:"/btn-googleplay.png"});default:return null}},S=m.Z.Title,F=m.Z.Text,q=P().div(t||(t=(0,h.Z)(["\n  flex\n  flex-col\n  items-center\n  lg:items-start\n"]))),D=P().div(s||(s=(0,h.Z)(["\n  mt-6\n  flex\n  space-x-4\n"]))),R=function(){return(0,C.jsxs)(q,{children:[(0,C.jsx)(S,{className:"text-center lg:text-left",level:2,children:"Keep track of your favorite events"}),(0,C.jsx)(F,{className:"text-lg",children:"Never forget an event again!"}),(0,C.jsxs)(D,{children:[(0,C.jsx)(L,{store:"appstore"}),(0,C.jsx)(L,{store:"google_play"})]})]})},K=r(23363),A=r(15312),M=(r(98330),r(716)),$=r(83189),z=r(41890),B=P().div(o||(o=(0,h.Z)(["\n  flex\n  flex-col\n  items-center\n"]))),X=P().div(i||(i=(0,h.Z)(["\n  w-full\n  max-w-md\n"]))),G=function(e){var n=e.children;return(0,C.jsx)(B,{children:(0,C.jsx)(X,{children:n})})},J=function(e){var n=e.children,r=e.order;return(0,C.jsx)(E.Z,{span:24,lg:{span:12,order:r},children:n})},W=function(e){var n=e.title,r=e.description,t=e.activeMenuKey,s=e.children;return(0,C.jsxs)($.Z,{activeMenuKey:t,children:[(0,C.jsxs)(M.Z,{children:[(0,C.jsx)(z.Z,{children:n}),(0,C.jsx)(A.Z,{children:r})]}),(0,C.jsx)(K.Z,{children:(0,C.jsxs)(N.Z,{className:"space-y-16 lg:space-y-10",children:[(0,C.jsx)(J,{order:2,children:s}),(0,C.jsx)(J,{order:1,children:(0,C.jsx)(G,{children:(0,C.jsx)(R,{})})})]})})]})},Y=r(67294),H=(0,w.Pi)((function(e){var n=e.children,r=e.redirectTo,t=(0,Y.useState)(!1),s=t[0],o=t[1],i=(0,T.oR)("session"),a=(0,Z.useRouter)(),c=i.userIsLoggedIn;return(0,Y.useEffect)((function(){if(c){var e,n=r||(null===(e=a.query)||void 0===e?void 0:e.redirectTo)||"/";a.replace(n)}else o(!0)}),[r,a,c]),i.isLoading?(0,C.jsx)(_.Z,{}):c||!s?null:(0,C.jsx)(C.Fragment,{children:n})})),Q=r(59499),U=r(28687),V=r(35235),ee=r(60845);function ne(e,n){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var t=Object.getOwnPropertySymbols(e);n&&(t=t.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),r.push.apply(r,t)}return r}function re(e){for(var n=1;n<arguments.length;n++){var r=null!=arguments[n]?arguments[n]:{};n%2?ne(Object(r),!0).forEach((function(n){(0,Q.Z)(e,n,r[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):ne(Object(r)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(r,n))}))}return e}var te,se,oe,ie=(0,U.gql)(a||(a=(0,h.Z)(["\n  ","\n  mutation Login($email: Email!, $password: String!) {\n    login(input: {email: $email, password: $password}) {\n      ...SessionPayloadFields\n    }\n  }\n"])),ee.P.sessionPayloadFields),ae=m.Z.Text,ce=P().div(te||(te=(0,h.Z)(["\n  flex\n  space-x-4\n"]))),le=P()(f.default)(se||(se=(0,h.Z)(["\n  flex-1\n  text-gray-500\n"]))),ue=P()(x.Z)(oe||(oe=(0,h.Z)(["\n  text-black\n  text-opacity-50\n"]))),de=(0,w.Pi)((function(e){var n=e.redirectTo,r=(0,Z.useRouter)(),t=(0,T.oR)("session"),s=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return(0,V.C0)(ie,re({dataKey:"login"},e))}({onSuccess:function(){var e=(0,p.Z)(j().mark((function e(s){var o,i;return j().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,t.onNewSession(h(s));case 2:if(!t.userIsLoggedIn){e.next=7;break}return i=n||(null===(o=r.query)||void 0===o?void 0:o.redirectTo)||"/",d.default.success("Welcome ".concat(t.user.firstName)),e.next=7,r.replace(i);case 7:case"end":return e.stop()}}),e)})));return function(n){return e.apply(this,arguments)}}()}),o=s.mutate,i=s.isLoading,a=s.data,x=s.error,h=s.extractPayload,m=s.validatePayload,g=s.reset;if(i||t.isLoading)return(0,C.jsx)(_.Z,{});var w=m(a);return x||w.errors||t.error?(0,C.jsx)(u.default,{message:"Error logging in",description:JSON.stringify(x),type:"error",closable:!0,onClose:g}):t.userIsLoggedIn?null:(0,C.jsxs)(C.Fragment,{children:[(0,C.jsxs)(ce,{children:[(0,C.jsx)(le,{icon:(0,C.jsx)(v.Z,{})}),(0,C.jsx)(le,{icon:(0,C.jsx)(y.Z,{})})]}),(0,C.jsx)(ue,{children:"Or continue with"}),(0,C.jsxs)(c.Z,{name:"login",layout:"vertical",size:"large",onFinish:o,hideRequiredMark:!0,children:[(0,C.jsx)(c.Z.Item,{label:"Email",name:"email",rules:[{required:!0,message:"Enter your email"},{type:"email"}],validateTrigger:"onBlur",children:(0,C.jsx)(l.Z,{type:"email",autoComplete:"username"})}),(0,C.jsx)(c.Z.Item,{label:"Password",name:"password",rules:[{required:!0,message:"Enter your password"},{min:8}],validateTrigger:"onBlur",children:(0,C.jsx)(l.Z.Password,{autoComplete:"current-password"})}),(0,C.jsx)("div",{className:"mb-6",children:(0,C.jsx)(ae,{type:"secondary",children:"Forgot your password? Reset Password"})}),(0,C.jsx)(c.Z.Item,{children:(0,C.jsx)(f.default,{type:"primary",htmlType:"submit",block:!0,children:"Login"})})]})]})})),pe=function(e){var n=e.redirectTo;return(0,C.jsx)(H,{children:(0,C.jsx)(W,{activeMenuKey:"login",title:"Login to Your Account",description:(0,C.jsxs)(C.Fragment,{children:["Or ",(0,C.jsx)(O.Z,{href:"/",children:"Create A New Account"})," if you don't have one"]}),children:(0,C.jsx)(G,{children:(0,C.jsx)(de,{redirectTo:n})})})})},xe=function(){return(0,C.jsx)(pe,{})}},7156:function(e,n,r){(window.__NEXT_P=window.__NEXT_P||[]).push(["/login",function(){return r(56257)}])}},function(e){e.O(0,[294,21,713,554,270,142,774,888,179],(function(){return n=7156,e(e.s=n);var n}));var n=e.O();_N_E=n}]);