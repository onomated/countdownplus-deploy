"use strict";
exports.id = 785;
exports.ids = [785];
exports.modules = {

/***/ 6785:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var antd_lib_avatar_style__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(82815);
/* harmony import */ var antd_lib_avatar_style__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(antd_lib_avatar_style__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var antd_lib_avatar__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(45998);
/* harmony import */ var antd_lib_avatar__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(antd_lib_avatar__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var antd_lib_image_style__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(47811);
/* harmony import */ var antd_lib_image_style__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(antd_lib_image_style__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var antd_lib_image__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(18070);
/* harmony import */ var antd_lib_image__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(antd_lib_image__WEBPACK_IMPORTED_MODULE_3__);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(16689);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_4__);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(20997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_5__);




const _excluded = ["user", "size"];

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }




const resolveCssColor = color => {
  return color ? color : 'var(--primary-color)';
};

const resolveSize = size => {
  if (size && Number.isInteger(size)) return size;

  switch (size) {
    case 'xs':
      return 32;

    case 'sm':
      return 40;

    case 'lg':
      return 88;

    case 'xl':
      return 100;

    default:
      // i.e. md
      return 58;
  }
};

const UserAvatar = _ref => {
  let {
    user,
    size
  } = _ref,
      rest = _objectWithoutProperties(_ref, _excluded);

  const {
    0: imageLoadFailed,
    1: setImageLoadFailed
  } = (0,react__WEBPACK_IMPORTED_MODULE_4__.useState)(false);
  const resolvedSize = resolveSize(size);
  const resolvedLetters = user === null || user === void 0 ? void 0 : user.avatarLetters;
  const resolvedColor = resolveCssColor(null);
  const style = {
    backgroundColor: resolvedColor
  };
  style.fontSize = `${Math.floor(resolvedSize / 2)}px`;
  let src = undefined;

  if (user !== null && user !== void 0 && user.avatarUrl && !imageLoadFailed) {
    src = /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_5__.jsx((antd_lib_image__WEBPACK_IMPORTED_MODULE_3___default()), {
      alt: `${user.username} profile image`,
      src: user.avatarUrl,
      width: resolvedSize,
      preview: false,
      onError: () => {
        setImageLoadFailed(true);
      }
    });
  }

  return /*#__PURE__*/react_jsx_runtime__WEBPACK_IMPORTED_MODULE_5__.jsx((antd_lib_avatar__WEBPACK_IMPORTED_MODULE_1___default()), _objectSpread(_objectSpread({
    className: "flex-none",
    src: src,
    style: style,
    size: resolvedSize
  }, rest), {}, {
    children: resolvedLetters
  }));
};

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (UserAvatar);

/***/ })

};
;