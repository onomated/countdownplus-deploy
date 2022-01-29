"use strict";
exports.id = 422;
exports.ids = [422];
exports.modules = {

/***/ 14422:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "default": () => (/* binding */ layout)
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
// EXTERNAL MODULE: ./src/components/Logo/index.js
var Logo = __webpack_require__(13347);
// EXTERNAL MODULE: ./node_modules/antd/lib/dropdown/style/index.js
var dropdown_style = __webpack_require__(6373);
// EXTERNAL MODULE: external "antd/lib/dropdown"
var dropdown_ = __webpack_require__(1788);
var dropdown_default = /*#__PURE__*/__webpack_require__.n(dropdown_);
// EXTERNAL MODULE: ./node_modules/antd/lib/menu/style/index.js
var menu_style = __webpack_require__(54214);
// EXTERNAL MODULE: external "antd/lib/menu"
var menu_ = __webpack_require__(10274);
var menu_default = /*#__PURE__*/__webpack_require__.n(menu_);
// EXTERNAL MODULE: external "mobx-react-lite"
var external_mobx_react_lite_ = __webpack_require__(45944);
// EXTERNAL MODULE: ./src/components/UserAvatar/index.js
var UserAvatar = __webpack_require__(6785);
// EXTERNAL MODULE: ./src/stores/index.js + 3 modules
var stores = __webpack_require__(70109);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(20997);
;// CONCATENATED MODULE: ./src/domains/admin/layout/ContentHeader/index.js












const {
  Header
} = (layout_default());
const StyledHeader = external_tailwind_styled_components_default()(Header)`
  p-0
`;
const StyledMenuItem = external_styled_components_default()((menu_default()).Item).withConfig({
  displayName: "ContentHeader__StyledMenuItem",
  componentId: "sc-oouxj1-0"
})(["&::after{border-bottom-color:transparent !important;}"]);

const AdminActionsMenu = () => {
  return /*#__PURE__*/jsx_runtime_.jsx((menu_default()), {
    children: /*#__PURE__*/jsx_runtime_.jsx((menu_default()).Item, {
      children: "Sign out and Exit"
    }, "logout")
  });
};

const AdminMenu = (0,external_mobx_react_lite_.observer)(() => {
  const sessionStore = (0,stores/* useStore */.oR)('session');
  const user = sessionStore.user;
  return /*#__PURE__*/jsx_runtime_.jsx("div", {
    className: "flex justify-end border-b",
    children: /*#__PURE__*/jsx_runtime_.jsx((menu_default()), {
      className: "border-b-0",
      mode: "horizontal",
      children: /*#__PURE__*/jsx_runtime_.jsx(StyledMenuItem, {
        children: /*#__PURE__*/jsx_runtime_.jsx((dropdown_default()), {
          overlay: /*#__PURE__*/jsx_runtime_.jsx(AdminActionsMenu, {}),
          placement: "bottomRight",
          children: /*#__PURE__*/jsx_runtime_.jsx(UserAvatar/* default */.Z, {
            letters: user.avatarLetters
          })
        })
      }, "admin-menu-avatar")
    })
  });
});

const ContentHeader = () => {
  return /*#__PURE__*/jsx_runtime_.jsx(StyledHeader, {
    children: /*#__PURE__*/jsx_runtime_.jsx(AdminMenu, {})
  });
};

/* harmony default export */ const layout_ContentHeader = (ContentHeader);
// EXTERNAL MODULE: external "lodash"
var external_lodash_ = __webpack_require__(46517);
// EXTERNAL MODULE: ./src/utils/array-utils.js
var array_utils = __webpack_require__(4190);
// EXTERNAL MODULE: ./src/components/AutoLink/index.js
var AutoLink = __webpack_require__(12467);
;// CONCATENATED MODULE: ./src/domains/admin/layout/SideMenu/index.js







const {
  SubMenu
} = (menu_default());

const itemSpec = (title, href, key) => ({
  title,
  href,
  key: key !== null && key !== void 0 ? key : `${href.split('/').join('_')}_page`
});

const submenuSpec = (title, items, key) => ({
  title,
  items,
  key: key !== null && key !== void 0 ? key : `${(0,external_lodash_.snakeCase)(title)}_submenu`
});

const menuSpec = [itemSpec('Dashboard', '', 'dashboard_page'), submenuSpec('Users', [itemSpec('List Users', 'users'), itemSpec('Merge Users', 'users/merge')]), submenuSpec('Events', [itemSpec('List Events', 'events')]), submenuSpec('Groups', [itemSpec('List Groups', 'groups')])];

const isSubmenuSpec = spec => !!spec.items;

const findOpenSubMenuKey = selectedMenuKey => {
  const found = menuSpec.find(spec => {
    if (isSubmenuSpec(spec)) {
      return spec.items.find(itemSpec => itemSpec.key === selectedMenuKey);
    }

    return false;
  });
  return (0,array_utils/* arrayWrap */.s)(found === null || found === void 0 ? void 0 : found.key);
};

const StyledMenu = external_tailwind_styled_components_default()((menu_default()))`
  h-full
  border-r-0
`;

const renderMenuItem = ({
  title,
  href,
  key
}) => /*#__PURE__*/jsx_runtime_.jsx((menu_default()).Item, {
  children: /*#__PURE__*/jsx_runtime_.jsx(AutoLink/* default */.Z, {
    href: `/admin/${href}`,
    children: title
  })
}, key);

const renderSubMenu = ({
  title,
  items,
  key
}) => /*#__PURE__*/jsx_runtime_.jsx(SubMenu, {
  title: title,
  children: items.map(renderMenuItem)
}, key);

const renderSpec = spec => isSubmenuSpec(spec) ? renderSubMenu(spec) : renderMenuItem(spec);

const SideMenu = ({
  selectedMenuKey
}) => {
  const selectedKeys = (0,array_utils/* arrayWrap */.s)(selectedMenuKey);
  const openKeys = findOpenSubMenuKey(selectedMenuKey);
  return /*#__PURE__*/jsx_runtime_.jsx(StyledMenu, {
    mode: "inline",
    defaultOpenKeys: openKeys,
    selectedKeys: selectedKeys,
    children: menuSpec.map(renderSpec)
  });
};

/* harmony default export */ const layout_SideMenu = (SideMenu);
;// CONCATENATED MODULE: ./src/domains/admin/layout/index.js









const {
  Content,
  Sider
} = (layout_default());
const Container = external_tailwind_styled_components_default()((layout_default()))`
  h-full
`;
const FixedSider = external_tailwind_styled_components_default()(Sider)`
  fixed
  left-0
  h-screen
`;
const LogoContainer = external_styled_components_default().div.withConfig({
  displayName: "layout__LogoContainer",
  componentId: "sc-1a5feh9-0"
})(["height:var(--layout-header-height);display:flex;justify-content:center;align-items:center;"]);
const SideMenuContainer = external_styled_components_default().div.withConfig({
  displayName: "layout__SideMenuContainer",
  componentId: "sc-1a5feh9-1"
})(["padding-top:0.5rem;height:calc(100% - var(--layout-header-height));overflow:auto;::-webkit-scrollbar{width:6px;}::-webkit-scrollbar-thumb{background:rgba(0,0,0,0.12);}"]);
const ContentSection = external_styled_components_default()((layout_default())).withConfig({
  displayName: "layout__ContentSection",
  componentId: "sc-1a5feh9-2"
})(["padding-left:200px;"]);
const ContentContainer = external_tailwind_styled_components_default()(Content)`
  px-4
  py-6
  w-full
  overflow-auto
`;

const AdminLayout = ({
  children,
  selectedMenuKey
}) => /*#__PURE__*/jsx_runtime_.jsx(Container, {
  children: /*#__PURE__*/(0,jsx_runtime_.jsxs)((layout_default()), {
    children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(FixedSider, {
      children: [/*#__PURE__*/jsx_runtime_.jsx(LogoContainer, {
        className: "border-b",
        children: /*#__PURE__*/jsx_runtime_.jsx(Logo/* default */.Z, {
          sm: true
        })
      }), /*#__PURE__*/jsx_runtime_.jsx(SideMenuContainer, {
        className: "border-r pr-px",
        children: /*#__PURE__*/jsx_runtime_.jsx(layout_SideMenu, {
          selectedMenuKey: selectedMenuKey
        })
      })]
    }), /*#__PURE__*/(0,jsx_runtime_.jsxs)(ContentSection, {
      children: [/*#__PURE__*/jsx_runtime_.jsx(layout_ContentHeader, {}), /*#__PURE__*/jsx_runtime_.jsx(ContentContainer, {
        children: children
      })]
    })]
  })
});

/* harmony default export */ const layout = (AdminLayout);

/***/ })

};
;