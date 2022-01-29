"use strict";
exports.id = 561;
exports.ids = [561];
exports.modules = {

/***/ 90213:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__);

const PageContainer = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().div)`
  container
  mx-auto
  my-8
  py-4
  px-4
  md:px-2
  max-w-screen-xl
`;
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (PageContainer);

/***/ }),

/***/ 68508:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(23461);
/* harmony import */ var antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var antd_lib_typography__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(58168);
/* harmony import */ var antd_lib_typography__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(antd_lib_typography__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__);




const {
  Text
} = (antd_lib_typography__WEBPACK_IMPORTED_MODULE_1___default());
const StyledDescription = tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2___default()(Text)`
  text-xl
`;

const PageDescription = ({
  children
}) => /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsx(StyledDescription, {
  type: "secondary",
  children: children
});

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (PageDescription);

/***/ }),

/***/ 83703:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var antd_lib_row_style__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(30467);
/* harmony import */ var antd_lib_row_style__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(antd_lib_row_style__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var antd_lib_row__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(27050);
/* harmony import */ var antd_lib_row__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(antd_lib_row__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__);


const _excluded = ["children"];

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }



const PageGrid = _ref => {
  let {
    children
  } = _ref,
      rest = _objectWithoutProperties(_ref, _excluded);

  return /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx((antd_lib_row__WEBPACK_IMPORTED_MODULE_1___default()), _objectSpread(_objectSpread({
    gutter: {
      xs: 8,
      sm: 12,
      md: 16,
      lg: 20,
      xl: 24,
      xxl: 28
    }
  }, rest), {}, {
    children: children
  }));
};

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (PageGrid);

/***/ }),

/***/ 18723:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(57518);
/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(styled_components__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_1__);


const StyledHero = styled_components__WEBPACK_IMPORTED_MODULE_0___default().div.withConfig({
  displayName: "PageHero__StyledHero",
  componentId: "sc-1ycf4dr-0"
})(["background:url('/hero-left-bg.png'),url('/hero-right-bg.png');background-repeat:no-repeat,no-repeat;background-position:0% 100%,100% 100%;"]);
const PageHero = tailwind_styled_components__WEBPACK_IMPORTED_MODULE_1___default()(StyledHero)`
  p-6
  md:p-16
  text-center
`;
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (PageHero);

/***/ }),

/***/ 8741:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": () => (/* binding */ components_PageLayout)
});

// EXTERNAL MODULE: ./node_modules/antd/lib/layout/style/index.js
var style = __webpack_require__(73431);
// EXTERNAL MODULE: external "antd/lib/layout"
var layout_ = __webpack_require__(45417);
var layout_default = /*#__PURE__*/__webpack_require__.n(layout_);
// EXTERNAL MODULE: external "styled-components"
var external_styled_components_ = __webpack_require__(57518);
var external_styled_components_default = /*#__PURE__*/__webpack_require__.n(external_styled_components_);
// EXTERNAL MODULE: external "tailwind-styled-components"
var external_tailwind_styled_components_ = __webpack_require__(4191);
var external_tailwind_styled_components_default = /*#__PURE__*/__webpack_require__.n(external_tailwind_styled_components_);
// EXTERNAL MODULE: ./node_modules/antd/lib/col/style/index.js
var col_style = __webpack_require__(58136);
// EXTERNAL MODULE: external "antd/lib/col"
var col_ = __webpack_require__(28518);
var col_default = /*#__PURE__*/__webpack_require__.n(col_);
// EXTERNAL MODULE: ./src/components/AppName/index.js
var AppName = __webpack_require__(30838);
// EXTERNAL MODULE: ./src/components/PageContainer/index.js
var PageContainer = __webpack_require__(90213);
// EXTERNAL MODULE: ./src/components/PageGrid/index.js
var PageGrid = __webpack_require__(83703);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(20997);
;// CONCATENATED MODULE: ./src/components/PageFooter/index.js










const Footer = external_tailwind_styled_components_default()((layout_default()).Footer)`
  text-sm
  bg-transparent
  mt-4
  py-6
  px-8
  md:px-12
`;

const Group = ({
  children
}) => /*#__PURE__*/jsx_runtime_.jsx((col_default()), {
  className: "text-center lg:text-left",
  span: 24,
  sm: 12,
  lg: 6,
  children: children
});

const Title = ({
  children
}) => /*#__PURE__*/jsx_runtime_.jsx("h5", {
  className: "text-xs pt-6 pb-2 uppercase text-black font-bold text-opacity-50 tracking-widest",
  children: children
});

const Item = (external_tailwind_styled_components_default()).li`
  py-2
`;
const Copyright = (external_tailwind_styled_components_default()).div`
  flex flex-col
  items-center
`;

const PageFooter = () => /*#__PURE__*/jsx_runtime_.jsx(Footer, {
  children: /*#__PURE__*/(0,jsx_runtime_.jsxs)(PageContainer/* default */.Z, {
    children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(PageGrid/* default */.Z, {
      children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(Group, {
        children: [/*#__PURE__*/jsx_runtime_.jsx(Title, {
          children: "Trending Events"
        }), /*#__PURE__*/(0,jsx_runtime_.jsxs)("ul", {
          children: [/*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Countdown calendar app"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Calendar app"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Holiday Calendar"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Birthday apps"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Event app"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Reminder app"
          })]
        })]
      }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(Group, {
        children: [/*#__PURE__*/jsx_runtime_.jsx(Title, {
          children: "About"
        }), /*#__PURE__*/(0,jsx_runtime_.jsxs)("ul", {
          children: [/*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "About us"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Download the app"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Blog"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Privacy Policy"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Cookies"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Terms of Use"
          })]
        })]
      }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(Group, {
        children: [/*#__PURE__*/jsx_runtime_.jsx(Title, {
          children: "Get in Touch"
        }), /*#__PURE__*/(0,jsx_runtime_.jsxs)("ul", {
          children: [/*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "iOS app page"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Android app page"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Support Page"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Help Forum"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Help Articles"
          })]
        })]
      }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(Group, {
        children: [/*#__PURE__*/jsx_runtime_.jsx(Title, {
          children: "Follow Us"
        }), /*#__PURE__*/(0,jsx_runtime_.jsxs)("ul", {
          children: [/*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Facebook"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Instagram"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "Twitter"
          }), /*#__PURE__*/jsx_runtime_.jsx(Item, {
            children: "YouTube tutorials"
          })]
        })]
      })]
    }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(Copyright, {
      children: [/*#__PURE__*/jsx_runtime_.jsx(AppName/* default */.Z, {
        className: "mt-6"
      }), /*#__PURE__*/(0,jsx_runtime_.jsxs)("span", {
        className: "my-5 text-center",
        children: ["CountdownPlus, Copyright \xA9 ", new Date().getFullYear(), " Created by Apps Beyond LLC"]
      })]
    })]
  })
});

/* harmony default export */ const components_PageFooter = (PageFooter);
// EXTERNAL MODULE: ./node_modules/antd/lib/grid/style/index.js
var grid_style = __webpack_require__(27124);
// EXTERNAL MODULE: external "antd/lib/grid"
var grid_ = __webpack_require__(19689);
var grid_default = /*#__PURE__*/__webpack_require__.n(grid_);
// EXTERNAL MODULE: ./src/utils/array-utils.js
var array_utils = __webpack_require__(4190);
// EXTERNAL MODULE: ./src/components/Logo/index.js
var Logo = __webpack_require__(13347);
// EXTERNAL MODULE: ./node_modules/antd/lib/button/style/index.js
var button_style = __webpack_require__(1025);
// EXTERNAL MODULE: external "antd/lib/button"
var button_ = __webpack_require__(53800);
var button_default = /*#__PURE__*/__webpack_require__.n(button_);
// EXTERNAL MODULE: ./node_modules/antd/lib/typography/style/index.js
var typography_style = __webpack_require__(23461);
// EXTERNAL MODULE: external "antd/lib/typography"
var typography_ = __webpack_require__(58168);
var typography_default = /*#__PURE__*/__webpack_require__.n(typography_);
// EXTERNAL MODULE: ./node_modules/@ant-design/icons/lib/index.js
var lib = __webpack_require__(39389);
var lib_default = /*#__PURE__*/__webpack_require__.n(lib);
// EXTERNAL MODULE: external "mobx-react-lite"
var external_mobx_react_lite_ = __webpack_require__(45944);
// EXTERNAL MODULE: external "react"
var external_react_ = __webpack_require__(16689);
// EXTERNAL MODULE: ./src/stores/index.js + 3 modules
var stores = __webpack_require__(70109);
// EXTERNAL MODULE: ./src/components/AutoLink/index.js
var AutoLink = __webpack_require__(12467);
;// CONCATENATED MODULE: ./src/components/icons/CollapedNavIcon/CollapsedNavIcon.js
function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }





var Svg = function Svg(props) {
  return /*#__PURE__*/jsx_runtime_.jsx("svg", _objectSpread(_objectSpread({}, props), {}, {
    children: /*#__PURE__*/jsx_runtime_.jsx("path", {
      fill: "none",
      stroke: "currentColor",
      strokeLinecap: "round",
      strokeLinejoin: "round",
      d: "M13.5 2H.5M13.5 7H.5M13.5 12H.5"
    })
  }));
};

Svg.defaultProps = {
  xmlns: "http://www.w3.org/2000/svg",
  viewBox: "0 0 14 14"
};

const CollapsedNavIcon = props => /*#__PURE__*/jsx_runtime_.jsx((lib_default()), _objectSpread({
  component: Svg
}, props));

/* harmony default export */ const CollapedNavIcon_CollapsedNavIcon = (CollapsedNavIcon);
;// CONCATENATED MODULE: ./src/components/icons/UserPlaceholderIcon/UserPlaceholderIcon.js
function UserPlaceholderIcon_ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function UserPlaceholderIcon_objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { UserPlaceholderIcon_ownKeys(Object(source), true).forEach(function (key) { UserPlaceholderIcon_defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { UserPlaceholderIcon_ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function UserPlaceholderIcon_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }






var UserPlaceholderIcon_Svg = function Svg(props) {
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)("svg", UserPlaceholderIcon_objectSpread(UserPlaceholderIcon_objectSpread({}, props), {}, {
    children: [/*#__PURE__*/jsx_runtime_.jsx("circle", {
      cx: "7",
      cy: "5.5",
      r: "2.5",
      fill: "none",
      stroke: "currentColor",
      strokeLinecap: "round",
      strokeLinejoin: "round"
    }), /*#__PURE__*/jsx_runtime_.jsx("path", {
      d: "M2.73 11.9a5 5 0 0 1 8.54 0",
      fill: "none",
      stroke: "currentColor",
      strokeLinecap: "round",
      strokeLinejoin: "round"
    }), /*#__PURE__*/jsx_runtime_.jsx("circle", {
      cx: "7",
      cy: "7",
      r: "6.5",
      fill: "none",
      stroke: "currentColor",
      strokeLinecap: "round",
      strokeLinejoin: "round"
    })]
  }));
};

UserPlaceholderIcon_Svg.defaultProps = {
  xmlns: "http://www.w3.org/2000/svg",
  viewBox: "0 0 14 14"
};

const UserPlaceholderIcon = props => /*#__PURE__*/jsx_runtime_.jsx((lib_default()), UserPlaceholderIcon_objectSpread({
  component: UserPlaceholderIcon_Svg
}, props));

/* harmony default export */ const UserPlaceholderIcon_UserPlaceholderIcon = (UserPlaceholderIcon);
;// CONCATENATED MODULE: ./src/components/icons/index.js


// EXTERNAL MODULE: ./src/components/UserAvatar/index.js
var UserAvatar = __webpack_require__(6785);
// EXTERNAL MODULE: ./node_modules/antd/lib/menu/style/index.js
var menu_style = __webpack_require__(54214);
// EXTERNAL MODULE: external "antd/lib/menu"
var menu_ = __webpack_require__(10274);
var menu_default = /*#__PURE__*/__webpack_require__.n(menu_);
;// CONCATENATED MODULE: ./src/components/PageHeader/DropdownMenuItem.js



const DropdownMenuItem = external_tailwind_styled_components_default()((menu_default()).Item)`
  px-8
`;
/* harmony default export */ const PageHeader_DropdownMenuItem = (DropdownMenuItem);
// EXTERNAL MODULE: ./node_modules/antd/lib/dropdown/style/index.js
var dropdown_style = __webpack_require__(6373);
// EXTERNAL MODULE: external "antd/lib/dropdown"
var dropdown_ = __webpack_require__(1788);
var dropdown_default = /*#__PURE__*/__webpack_require__.n(dropdown_);
;// CONCATENATED MODULE: ./src/components/PageHeader/StyledMenu.js



const StyledMenu = external_tailwind_styled_components_default()((menu_default()))`
  justify-center
  border-b-0
`;
/* harmony default export */ const PageHeader_StyledMenu = (StyledMenu);
;// CONCATENATED MODULE: ./src/components/PageHeader/StyledMenuItem.js



const StyledMenuItem = external_tailwind_styled_components_default()((menu_default()).Item)`
  mx-0
  md:mx-1
  px-3
  sm:px-4
`;
/* harmony default export */ const PageHeader_StyledMenuItem = (StyledMenuItem);
;// CONCATENATED MODULE: ./src/components/PageHeader/MinimizedMenu.js







const MinimizedMenuItem = external_styled_components_default()(PageHeader_StyledMenuItem).withConfig({
  displayName: "MinimizedMenu__MinimizedMenuItem",
  componentId: "sc-1uff8sm-0"
})(["&::after{border-bottom-color:transparent !important;}"]);

const MinimizedMenu = ({
  menuKey,
  selectedKeys,
  dropdownMenuComponent: DropdownMenuComponent,
  iconComponent: IconComponent
}) => {
  const dropdownMenu = /*#__PURE__*/jsx_runtime_.jsx(DropdownMenuComponent, {
    selectedKeys: selectedKeys,
    isDropdown: true
  });

  return /*#__PURE__*/jsx_runtime_.jsx(jsx_runtime_.Fragment, {
    children: /*#__PURE__*/jsx_runtime_.jsx(PageHeader_StyledMenu, {
      mode: "horizontal",
      selectable: false,
      children: /*#__PURE__*/jsx_runtime_.jsx(MinimizedMenuItem, {
        children: /*#__PURE__*/jsx_runtime_.jsx((dropdown_default()), {
          overlay: dropdownMenu,
          placement: "bottomRight",
          children: /*#__PURE__*/jsx_runtime_.jsx(IconComponent, {
            className: "text-2xl leading-none"
          })
        })
      }, `main-nav-collapsed-${menuKey}`)
    })
  });
};

/* harmony default export */ const PageHeader_MinimizedMenu = (MinimizedMenu);
// EXTERNAL MODULE: ./node_modules/antd/lib/popconfirm/style/index.js
var popconfirm_style = __webpack_require__(78994);
// EXTERNAL MODULE: external "antd/lib/popconfirm"
var popconfirm_ = __webpack_require__(93984);
var popconfirm_default = /*#__PURE__*/__webpack_require__.n(popconfirm_);
// EXTERNAL MODULE: ./node_modules/antd/lib/drawer/style/index.js
var drawer_style = __webpack_require__(16049);
// EXTERNAL MODULE: external "antd/lib/drawer"
var drawer_ = __webpack_require__(68000);
var drawer_default = /*#__PURE__*/__webpack_require__.n(drawer_);
// EXTERNAL MODULE: ./node_modules/antd/lib/divider/style/index.js
var divider_style = __webpack_require__(56120);
// EXTERNAL MODULE: external "antd/lib/divider"
var divider_ = __webpack_require__(2278);
var divider_default = /*#__PURE__*/__webpack_require__.n(divider_);
;// CONCATENATED MODULE: ./src/components/PageHeader/UserDrawer.js


















const {
  Text
} = (typography_default());
const UserDrawer = (0,external_mobx_react_lite_.observer)(({
  visible,
  closeDrawer
}) => {
  const sessionStore = (0,stores/* useStore */.oR)('session');
  const onSignOut = (0,external_react_.useCallback)(async () => {
    await closeDrawer();
    await sessionStore.onClearSession();
  }, [closeDrawer, sessionStore]);
  const user = sessionStore.user;
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)((drawer_default()), {
    placement: "right",
    visible: visible,
    onClose: closeDrawer,
    footer: /*#__PURE__*/jsx_runtime_.jsx(UserDrawerFooter, {
      onSignOut: onSignOut
    }),
    children: [/*#__PURE__*/jsx_runtime_.jsx(UserInfoHeader, {
      name: user.name,
      username: user.username,
      avatarLetters: user.avatarLetters,
      admin: sessionStore.userCanAdmin
    }), /*#__PURE__*/jsx_runtime_.jsx((divider_default()), {}), /*#__PURE__*/jsx_runtime_.jsx(DrawerLinks, {})]
  });
});

const UserInfoHeader = ({
  imageLink,
  name,
  username,
  avatarLetters,
  admin
}) => /*#__PURE__*/(0,jsx_runtime_.jsxs)("div", {
  className: "flex flex-col py-4 items-center",
  children: [imageLink ? /*#__PURE__*/jsx_runtime_.jsx(UserAvatar/* default */.Z, {
    size: 88,
    src: imageLink
  }) : /*#__PURE__*/jsx_runtime_.jsx(UserAvatar/* default */.Z, {
    size: 88,
    letters: avatarLetters
  }), /*#__PURE__*/jsx_runtime_.jsx(Text, {
    className: "font-bold text-lg mt-4",
    children: name
  }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(Text, {
    children: ["@", username]
  }), /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
    href: "/me",
    children: /*#__PURE__*/jsx_runtime_.jsx((button_default()), {
      className: "mt-6",
      type: "primary",
      ghost: true,
      block: true,
      children: "My Dashboard"
    })
  }), admin && /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
    href: "/admin",
    children: /*#__PURE__*/jsx_runtime_.jsx((button_default()), {
      className: "mt-3",
      block: true,
      children: "Admin Dashboard"
    })
  })]
});

const DrawerLinks = () => {
  const linksSpec = [{
    href: '/account/settings',
    text: 'Manage your account'
  }, {
    href: '/events/new',
    text: 'Create new event'
  }, {
    href: '/communities',
    text: 'Join a community'
  }, {
    href: '/me/friends/add',
    text: 'Add new friend'
  }];
  return /*#__PURE__*/jsx_runtime_.jsx("div", {
    className: "flex flex-col",
    children: linksSpec.map(({
      href,
      text
    }) => /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
      href: href,
      children: /*#__PURE__*/jsx_runtime_.jsx((button_default()), {
        className: "mt-4",
        shape: "round",
        block: true,
        children: text
      })
    }, href))
  });
};

const UserDrawerFooter = ({
  onSignOut
}) => /*#__PURE__*/(0,jsx_runtime_.jsxs)("div", {
  className: "flex flex-col py-4",
  children: [/*#__PURE__*/jsx_runtime_.jsx(SignOutControl, {
    onSignOut: onSignOut
  }), /*#__PURE__*/jsx_runtime_.jsx((divider_default()), {}), /*#__PURE__*/(0,jsx_runtime_.jsxs)("div", {
    className: "flex flex-row text-sm justify-evenly",
    children: [/*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
      href: "/privacy",
      children: "Privacy Policy"
    }), /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
      href: "/terms",
      children: "Terms of Service"
    })]
  })]
});

const SignOutControl = ({
  onSignOut
}) => {
  return /*#__PURE__*/jsx_runtime_.jsx((popconfirm_default()), {
    title: "Are you sure you want to sign out of your account",
    onConfirm: onSignOut,
    children: /*#__PURE__*/jsx_runtime_.jsx((button_default()), {
      children: "Sign out of account"
    })
  });
};

/* harmony default export */ const PageHeader_UserDrawer = (UserDrawer);
;// CONCATENATED MODULE: ./src/components/PageHeader/MainActionPanel.js




















const {
  Text: MainActionPanel_Text
} = (typography_default());
const controlSpec = [{
  key: 'register',
  href: '/register',
  title: 'Register'
}, {
  key: 'login',
  href: '/login',
  title: 'Login',
  titleRich: /*#__PURE__*/jsx_runtime_.jsx((button_default()), {
    type: "primary",
    shape: "round",
    children: "Sign in"
  })
}];
const ControlPanelContainer = (external_tailwind_styled_components_default()).div`
  flex
  justify-center
  m-0
  p-0
  text-left
`;
const ControlPanelItem = (external_tailwind_styled_components_default()).div`
  relative
  inline-block
  top-px
  align-bottom
  mx-0
  md:mx-1
  px-3
  sm:px-4
`;
const MaxWidthText = external_tailwind_styled_components_default()(MainActionPanel_Text)`
  max-w-48
  text-right
  pr-2
  font-bold
`;

const UserDrawerToggle = ({
  username,
  avatarLetters,
  showOpenIndicator
}) => {
  const {
    0: visible,
    1: setVisible
  } = (0,external_react_.useState)(false);
  const showDrawer = (0,external_react_.useCallback)(() => setVisible(true), []);
  const closeDrawer = (0,external_react_.useCallback)(() => setVisible(false), []);
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)(ControlPanelContainer, {
    children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(ControlPanelItem, {
      onClick: showDrawer,
      style: {
        cursor: 'pointer'
      },
      children: [username && /*#__PURE__*/(0,jsx_runtime_.jsxs)(MaxWidthText, {
        ellipsis: true,
        children: ["@", username]
      }), /*#__PURE__*/jsx_runtime_.jsx(UserAvatar/* default */.Z, {
        letters: avatarLetters
      }), showOpenIndicator && /*#__PURE__*/jsx_runtime_.jsx(lib.CaretRightOutlined, {})]
    }), /*#__PURE__*/jsx_runtime_.jsx(PageHeader_UserDrawer, {
      visible: visible,
      closeDrawer: closeDrawer
    })]
  });
};

const AuthMenu = ({
  selectedKeys,
  isDropdown
}) => {
  const resolvedMode = isDropdown ? 'vertical' : 'horizontal';
  const MenuItem = isDropdown ? PageHeader_DropdownMenuItem : PageHeader_StyledMenuItem;
  return /*#__PURE__*/jsx_runtime_.jsx(PageHeader_StyledMenu, {
    mode: resolvedMode,
    selectedKeys: selectedKeys,
    children: controlSpec.map(({
      key,
      href,
      title
    }) => /*#__PURE__*/jsx_runtime_.jsx(MenuItem, {
      children: /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
        href: href,
        children: title
      })
    }, `main-nav-${key}`))
  });
};

const MinimizedControlPanel = (0,external_mobx_react_lite_.observer)(({
  selectedKeys
}) => {
  const sessionStore = (0,stores/* useStore */.oR)('session');
  if (sessionStore.isLoading) return null;
  return sessionStore.userIsLoggedIn ? /*#__PURE__*/jsx_runtime_.jsx(UserDrawerToggle, {
    avatarLetters: sessionStore.user.avatarLetters,
    showOpenIndicator: true
  }) : /*#__PURE__*/jsx_runtime_.jsx(PageHeader_MinimizedMenu, {
    menuKey: "auth",
    selectedKeys: selectedKeys,
    dropdownMenuComponent: AuthMenu,
    iconComponent: UserPlaceholderIcon_UserPlaceholderIcon
  });
});

const ControlPanelUnauthed = () => {
  return /*#__PURE__*/jsx_runtime_.jsx(ControlPanelContainer, {
    children: controlSpec.map(({
      key,
      href,
      title,
      titleRich
    }) => /*#__PURE__*/jsx_runtime_.jsx(ControlPanelItem, {
      children: /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
        href: href,
        children: titleRich || title
      })
    }, `main-nav-${key}`))
  });
};

const ControlPanel = (0,external_mobx_react_lite_.observer)(() => {
  const sessionStore = (0,stores/* useStore */.oR)('session');
  if (sessionStore.isLoading) return null;
  return sessionStore.userIsLoggedIn ? /*#__PURE__*/jsx_runtime_.jsx(UserDrawerToggle, {
    username: sessionStore.user.username,
    avatarLetters: sessionStore.user.avatarLetters
  }) : /*#__PURE__*/jsx_runtime_.jsx(ControlPanelUnauthed, {});
});

const MainActionPanel = ({
  selectedKeys,
  isMinimized
}) => {
  if (isMinimized) {
    return /*#__PURE__*/jsx_runtime_.jsx(MinimizedControlPanel, {
      selectedKeys: selectedKeys
    });
  }

  return /*#__PURE__*/jsx_runtime_.jsx(ControlPanel, {});
};

/* harmony default export */ const PageHeader_MainActionPanel = (MainActionPanel);
;// CONCATENATED MODULE: ./src/components/PageHeader/MainNavMenu.js








const navSpec = [{
  key: 'home',
  href: '/',
  title: 'Home'
}, {
  key: 'discover',
  href: '/events',
  title: 'Discover'
}, {
  key: 'communities',
  href: '/communities',
  title: 'Communities'
}, {
  key: 'users',
  href: '/users',
  title: 'Users'
}, {
  key: 'blog',
  href: '/blog',
  title: 'Blog'
}];

const NavMenu = ({
  selectedKeys,
  isDropdown
}) => {
  const resolvedMode = isDropdown ? 'vertical' : 'horizontal';
  const MenuItem = isDropdown ? PageHeader_DropdownMenuItem : PageHeader_StyledMenuItem;
  return /*#__PURE__*/jsx_runtime_.jsx(jsx_runtime_.Fragment, {
    children: /*#__PURE__*/jsx_runtime_.jsx(PageHeader_StyledMenu, {
      mode: resolvedMode,
      selectedKeys: selectedKeys,
      children: navSpec.map(({
        key,
        href,
        title
      }) => /*#__PURE__*/jsx_runtime_.jsx(MenuItem, {
        children: /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
          href: href,
          children: title
        })
      }, `main-nav-${key}`))
    })
  });
};

const MinimizedNavMenu = ({
  selectedKeys
}) => /*#__PURE__*/jsx_runtime_.jsx(PageHeader_MinimizedMenu, {
  menuKey: "pages",
  selectedKeys: selectedKeys,
  dropdownMenuComponent: NavMenu,
  iconComponent: CollapedNavIcon_CollapsedNavIcon
});

const MainNavMenu = ({
  selectedKeys,
  isMinimized
}) => {
  if (isMinimized) {
    return /*#__PURE__*/jsx_runtime_.jsx(MinimizedNavMenu, {
      selectedKeys: selectedKeys
    });
  }

  return /*#__PURE__*/jsx_runtime_.jsx(NavMenu, {
    selectedKeys: selectedKeys
  });
};

/* harmony default export */ const PageHeader_MainNavMenu = (MainNavMenu);
;// CONCATENATED MODULE: ./src/components/PageHeader/index.js





function PageHeader_ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function PageHeader_objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { PageHeader_ownKeys(Object(source), true).forEach(function (key) { PageHeader_defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { PageHeader_ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function PageHeader_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }








const {
  useBreakpoint
} = (grid_default());
const StyledHeader = external_tailwind_styled_components_default()((layout_default()).Header)`
  flex
  px-4
`;
const FlexContainer = (external_tailwind_styled_components_default()).div`
  flex
  justify-right
`;
const BREAKPOINT_RANKS = {
  xs: 0,
  sm: 1,
  md: 2,
  lg: 3,
  xl: 4,
  xxl: 5
};

const currentBreakpointRank = screens => {
  let highestRank = undefined;
  Object.entries(screens).filter(([_screen, enabled]) => enabled).forEach(([screen, _enabled]) => {
    if (!highestRank || BREAKPOINT_RANKS[screen] > highestRank) {
      highestRank = BREAKPOINT_RANKS[screen];
    }
  });
  return highestRank;
};

const PageHeader = ({
  activeKey
}) => {
  const screens = useBreakpoint();
  const screenSizeRank = currentBreakpointRank(screens);
  const screenLessThanSm = screenSizeRank < BREAKPOINT_RANKS.sm;
  const screenLessThanLg = screenSizeRank < BREAKPOINT_RANKS.lg;
  const screenLessThanXl = screenSizeRank < BREAKPOINT_RANKS.xl;
  const selectedKeys = (0,array_utils/* arrayWrap */.s)(activeKey).map(k => `main-nav-${k}`);
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)(StyledHeader, {
    className: screenLessThanLg ? 'justify-between' : 'justify-around',
    children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(FlexContainer, {
      children: [/*#__PURE__*/jsx_runtime_.jsx(Logo/* default */.Z, PageHeader_objectSpread({
        className: "mr-0 sm:mr-4"
      }, screenLessThanSm ? {
        sm: true
      } : {})), screenLessThanLg ? null : /*#__PURE__*/jsx_runtime_.jsx(PageHeader_MainNavMenu, {
        selectedKeys: selectedKeys,
        isMinimized: false
      })]
    }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(FlexContainer, {
      children: [screenLessThanLg ? /*#__PURE__*/jsx_runtime_.jsx(PageHeader_MainNavMenu, {
        selectedKeys: selectedKeys,
        isMinimized: true
      }) : null, /*#__PURE__*/jsx_runtime_.jsx(PageHeader_MainActionPanel, {
        selectedKeys: selectedKeys,
        isMinimized: screenLessThanXl
      })]
    })]
  });
};

/* harmony default export */ const components_PageHeader = (PageHeader);
;// CONCATENATED MODULE: ./src/components/PageLayout/index.js








const StyledPageContainer = external_styled_components_default()((layout_default())).withConfig({
  displayName: "PageLayout__StyledPageContainer",
  componentId: "sc-1q3gzo-0"
})(["background-image:url('/body-bg.png');background-size:1440px 1090px;background-repeat:no-repeat;"]);
const PageLayout_PageContainer = external_tailwind_styled_components_default()(StyledPageContainer)`
  min-h-full
`;
const ContentContainer = external_tailwind_styled_components_default()((layout_default()).Content)`
`;

const PageLayout = ({
  activeMenuKey,
  children
}) => {
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)(PageLayout_PageContainer, {
    children: [/*#__PURE__*/jsx_runtime_.jsx(components_PageHeader, {
      activeKey: activeMenuKey
    }), /*#__PURE__*/jsx_runtime_.jsx(ContentContainer, {
      children: children
    }), /*#__PURE__*/jsx_runtime_.jsx(components_PageFooter, {})]
  });
};

/* harmony default export */ const components_PageLayout = (PageLayout);

/***/ }),

/***/ 43694:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(23461);
/* harmony import */ var antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(antd_lib_typography_style__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var antd_lib_typography__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(58168);
/* harmony import */ var antd_lib_typography__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(antd_lib_typography__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2__);



const {
  Title
} = (antd_lib_typography__WEBPACK_IMPORTED_MODULE_1___default());
const PageTitle = tailwind_styled_components__WEBPACK_IMPORTED_MODULE_2___default()(Title)`
`;
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (PageTitle);

/***/ })

};
;