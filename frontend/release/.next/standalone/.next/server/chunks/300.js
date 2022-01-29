"use strict";
exports.id = 300;
exports.ids = [300];
exports.modules = {

/***/ 30838:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__);



const Wrapper = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().div)`
  flex
  items-center
`;
const Title = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().span)`
  font-bold
  text-black
  text-opacity-85
`;
const Plus = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().span)`
  font-bold
  text-primary
`;

const classNames = size => {
  switch (size) {
    case 'lg':
    case 1:
      return ['text-lg', 'text-xl'];

    case 'xl':
    case 2:
      return ['text-xl', 'text-2xl'];

    case '2xl':
    case 3:
      return ['text-2xl', 'text-3xl'];

    case '3xl':
    case 4:
      return ['text-3xl', 'text-4xl'];

    case '4xl':
    case 5:
      return ['text-4xl', 'text-5xl'];

    default:
      return ['text-base', 'text-lg'];
  }
};

const AppName = ({
  className,
  size
}) => {
  const [titleClass, plusClass] = classNames(size);
  return /*#__PURE__*/(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsxs)(Wrapper, {
    className: className,
    children: [/*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx(Title, {
      className: titleClass,
      children: "Countdown"
    }), /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx(Plus, {
      className: plusClass,
      children: "+"
    })]
  });
};

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (AppName);

/***/ }),

/***/ 12467:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var next_link__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(41664);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(16689);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var _utils__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(8636);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__);
const _excluded = ["children", "href", "wrap", "target"];

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }






const isExternalLink = href => href.match(/https?:\/\//); /// https://nextjs.org/docs/api-reference/next/link


const AutoLink = _ref => {
  let {
    children,
    href,
    wrap,
    target
  } = _ref,
      rest = _objectWithoutProperties(_ref, _excluded);

  const doWrap = wrap || (0,_utils__WEBPACK_IMPORTED_MODULE_3__/* .isString */ .HD)(children);
  const deducedTarget = target || (isExternalLink(href) ? '_blank' : '_self');

  if (doWrap) {
    return /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx(next_link__WEBPACK_IMPORTED_MODULE_0__["default"], _objectSpread(_objectSpread({
      href: href
    }, rest), {}, {
      children: /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx("a", {
        target: deducedTarget,
        children: children
      })
    }));
  }

  return /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx(next_link__WEBPACK_IMPORTED_MODULE_0__["default"], _objectSpread(_objectSpread({
    href: href,
    passHref: true
  }, rest), {}, {
    children: children
  }));
};

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (AutoLink);

/***/ }),

/***/ 13347:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(4191);
/* harmony import */ var tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _AppName__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(30838);
/* harmony import */ var _AutoLink__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(12467);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__);
const _excluded = ["sm"];

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }






const HomeLink = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().a)`
  flex
`;
const LogoContainer = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().div)`
  flex
  items-center
`;
const Icon = (tailwind_styled_components__WEBPACK_IMPORTED_MODULE_0___default().img)`
  ${p => p.$sm ? 'w-8' : 'w-10'}
  ${p => p.$sm ? 'h-8' : 'h-10'}
  ${p => p.$sm ? 'mr-2' : 'mr-3'}
`;

const Logo = _ref => {
  let {
    sm
  } = _ref,
      rest = _objectWithoutProperties(_ref, _excluded);

  return /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsx(_AutoLink__WEBPACK_IMPORTED_MODULE_2__/* ["default"] */ .Z, {
    href: "/",
    children: /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsx(HomeLink, _objectSpread(_objectSpread({}, rest), {}, {
      children: /*#__PURE__*/(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsxs)(LogoContainer, {
        children: [/*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsx(Icon, {
          src: "/logo_80x80.png",
          $sm: sm
        }), /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_3__.jsx(_AppName__WEBPACK_IMPORTED_MODULE_1__/* ["default"] */ .Z, {
          size: sm ? 'xl' : '2xl'
        })]
      })
    }))
  });
};

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (Logo);

/***/ }),

/***/ 4190:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "s": () => (/* binding */ arrayWrap)
/* harmony export */ });
const arrayWrap = x => {
  if (Array.isArray(x)) return x;
  if (x === undefined) return [];
  return [x];
};

/***/ })

};
;