"use strict";
exports.id = 293;
exports.ids = [293];
exports.modules = {

/***/ 42293:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": () => (/* binding */ components_ProgressIndicator)
});

// EXTERNAL MODULE: ./node_modules/antd/lib/spin/style/index.js
var style = __webpack_require__(9405);
// EXTERNAL MODULE: external "antd/lib/spin"
var spin_ = __webpack_require__(80261);
var spin_default = /*#__PURE__*/__webpack_require__.n(spin_);
// EXTERNAL MODULE: external "react-topbar-progress-indicator"
var external_react_topbar_progress_indicator_ = __webpack_require__(27521);
var external_react_topbar_progress_indicator_default = /*#__PURE__*/__webpack_require__.n(external_react_topbar_progress_indicator_);
// EXTERNAL MODULE: external "tailwind-styled-components"
var external_tailwind_styled_components_ = __webpack_require__(4191);
var external_tailwind_styled_components_default = /*#__PURE__*/__webpack_require__.n(external_tailwind_styled_components_);
;// CONCATENATED MODULE: ./src/components/MetaContainer/index.js

const MetaContainer = (external_tailwind_styled_components_default()).div`
  flex
  flex-col
  content-center
  items-center
  justify-center
  text-center
  px-12
  py-8
  mx-0
  my-4
`;
/* harmony default export */ const components_MetaContainer = (MetaContainer);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(20997);
;// CONCATENATED MODULE: ./src/components/ProgressIndicator/index.js








const ContentProgress = () => /*#__PURE__*/jsx_runtime_.jsx(components_MetaContainer, {
  children: /*#__PURE__*/jsx_runtime_.jsx((spin_default()), {
    size: "large"
  })
});

const ProgressIndicator = ({
  showTopProgress = true,
  showContentProgress = true
}) => /*#__PURE__*/(0,jsx_runtime_.jsxs)(jsx_runtime_.Fragment, {
  children: [showTopProgress && /*#__PURE__*/jsx_runtime_.jsx((external_react_topbar_progress_indicator_default()), {}), showContentProgress && /*#__PURE__*/jsx_runtime_.jsx(ContentProgress, {})]
});

/* harmony default export */ const components_ProgressIndicator = (ProgressIndicator);

/***/ })

};
;