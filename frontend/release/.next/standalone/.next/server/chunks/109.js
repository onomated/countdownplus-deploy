"use strict";
exports.id = 109;
exports.ids = [109];
exports.modules = {

/***/ 405:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": () => (/* binding */ src_config)
});

;// CONCATENATED MODULE: ./src/config/api.js
const api = {
  baseUrl: "",
  graphqlUrl: `${""}/gql`,
  graphqlAdminUrl: `${""}/gql/admin`
};
;// CONCATENATED MODULE: ./src/config/debug.js
const debug = {
  enabled: "false" === 'true'
};
;// CONCATENATED MODULE: ./src/config/services.js
const services = {
  imageServerUrl: ""
};
;// CONCATENATED MODULE: ./src/config/index.js



const config = {
  api: api,
  debug: debug,
  services: services
};
/* harmony default export */ const src_config = (config);

/***/ }),

/***/ 8489:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "P": () => (/* binding */ fragments)
/* harmony export */ });
/* harmony import */ var graphql_request__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(5805);
/* harmony import */ var graphql_request__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(graphql_request__WEBPACK_IMPORTED_MODULE_0__);

const userFields = graphql_request__WEBPACK_IMPORTED_MODULE_0__.gql`
  fragment UserFields on User {
    id
    accountType
    firstName
    lastName
    username
    countryCode
  }
`;
const sessionFields = graphql_request__WEBPACK_IMPORTED_MODULE_0__.gql`
  ${userFields}
  fragment SessionFields on Session {
    expiresAt
    token
    user {
      ...UserFields
    }
  }
`;
const sessionPayloadFields = graphql_request__WEBPACK_IMPORTED_MODULE_0__.gql`
  ${sessionFields}
  fragment SessionPayloadFields on SessionPayload {
    successful
    messages {
      code
      message
      field
    }
    result {
      ...SessionFields
    }
  }
`;
const fragments = {
  userFields,
  sessionFields,
  sessionPayloadFields
};

/***/ }),

/***/ 59358:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "XR": () => (/* reexport */ AdminNetworkClientProvider),
  "PY": () => (/* reexport */ LocalStorageProvider),
  "k7": () => (/* reexport */ NetworkClientProvider),
  "CF": () => (/* reexport */ useAdminGraphQLConnectionQuery),
  "Rx": () => (/* reexport */ useAdminGraphqlClient),
  "b_": () => (/* reexport */ useGraphQLClient),
  "C0": () => (/* reexport */ useGraphQLMutation),
  "_": () => (/* reexport */ useLocalStorage)
});

// UNUSED EXPORTS: useAdminGraphQLMutation, useAdminGraphQLQuery, useGraphQLConnectionQuery, useGraphQLQuery

// EXTERNAL MODULE: external "localforage"
var external_localforage_ = __webpack_require__(3182);
var external_localforage_default = /*#__PURE__*/__webpack_require__.n(external_localforage_);
// EXTERNAL MODULE: external "react"
var external_react_ = __webpack_require__(16689);
// EXTERNAL MODULE: ./src/utils/env-utils.js
var env_utils = __webpack_require__(79143);
// EXTERNAL MODULE: ./src/utils/noops.js
var noops = __webpack_require__(6700);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(20997);
;// CONCATENATED MODULE: ./src/services/local-storage/index.js




const LocalStorageKeys = {
  session: 'session'
};

const initializeLocalStore = () => {
  let storage;

  if ((0,env_utils/* isServer */.s)()) {
    storage = {
      getItem: noops/* NOOP1 */.QO,
      setItem: noops/* NOOP2 */.LT,
      removeItem: noops/* NOOP1 */.QO
    };
  } else {
    external_localforage_default().config({
      // driver      : localforage.WEBSQL, // Force WebSQL; same as using setDriver()
      name: 'cplus',
      // 'localforage',
      // version     : 1.0,
      // size        : 4980736, // Size of database, in bytes. WebSQL-only for now.
      storeName: 'key_values' // 'keyvaluepairs', // Should be alphanumeric, with underscores.
      // description : 'some description'

    });
    storage = (external_localforage_default());
  }

  return storage;
};

class LocalStorageClient {
  constructor() {
    this.store = initializeLocalStore();
  }

  async setSession(session) {
    await this.store.setItem(LocalStorageKeys.session, session);
    this.session = session;
  }

  async getSession() {
    if (this.session) return this.session;
    this.session = await this.store.getItem(LocalStorageKeys.session);
    return this.session;
  }

  async removeSession() {
    this.session = null;
    return this.store.removeItem(LocalStorageKeys.session);
  }

}

const LocalStorageContext = /*#__PURE__*/(0,external_react_.createContext)(undefined);
const client = new LocalStorageClient();
const LocalStorageProvider = ({
  children
}) => {
  return /*#__PURE__*/jsx_runtime_.jsx(LocalStorageContext.Provider, {
    value: client,
    children: children
  });
};
const useLocalStorage = () => {
  const localStorage = (0,external_react_.useContext)(LocalStorageContext);

  if (!localStorage) {
    throw new Error('useLocalStorage must be used within LocalStorageProvider');
  }

  return localStorage;
};
// EXTERNAL MODULE: external "lodash.get"
var external_lodash_get_ = __webpack_require__(1043);
var external_lodash_get_default = /*#__PURE__*/__webpack_require__.n(external_lodash_get_);
// EXTERNAL MODULE: external "graphql-request"
var external_graphql_request_ = __webpack_require__(5805);
// EXTERNAL MODULE: external "react-query"
var external_react_query_ = __webpack_require__(61175);
// EXTERNAL MODULE: ./src/config/index.js + 3 modules
var config = __webpack_require__(405);
;// CONCATENATED MODULE: ./src/services/network/index.js
const _excluded = ["dataKey", "variables"],
      _excluded2 = ["dataKey", "variables"],
      _excluded3 = ["dataKey"];

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) { symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); } keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }








const resolvePayloadValidation = mutationPayload => {
  const {
    successful,
    messages,
    result
  } = mutationPayload || {};
  if (successful) return {
    isSuccessful: true,
    data: result
  };
  return {
    isSuccessful: false,
    errors: messages
  };
};

const queryFunctionFactory = ({
  gqlClient,
  query,
  variables,
  dataKey
}) => async ({
  pageParam: cursor
}) => {
  let allVars = variables;

  if (cursor) {
    const {
      paginate = {}
    } = variables;
    paginate.after = cursor;
    allVars = _objectSpread({
      paginate
    }, variables);
  }

  const res = await gqlClient.request(query, allVars);
  return external_lodash_get_default()(res, dataKey);
};

const getEndCursor = (lastPage, _allPages) => {
  const {
    pageInfo
  } = lastPage;
  return pageInfo.hasNextPage ? pageInfo.endCursor : undefined;
};

const computeTotalCount = result => {
  var _result$data;

  let total = 0;
  result === null || result === void 0 ? void 0 : (_result$data = result.data) === null || _result$data === void 0 ? void 0 : _result$data.pages.forEach(page => {
    var _page$pageInfo;

    total += (page === null || page === void 0 ? void 0 : (_page$pageInfo = page.pageInfo) === null || _page$pageInfo === void 0 ? void 0 : _page$pageInfo.itemCount) || 0;
  });
  return total;
};

const establishClient = uri => {
  // Setup graphql request client
  const graphqlClient = new external_graphql_request_.GraphQLClient(uri);
  const GraphQLClientContext = /*#__PURE__*/(0,external_react_.createContext)(undefined);

  const useGraphQLClient = () => {
    const gqlClient = (0,external_react_.useContext)(GraphQLClientContext);
    if (!gqlClient) throw new Error('useGraphQLClient must be called within GraphqlClientProvider');
    return gqlClient;
  };

  const GraphqlClientProvider = ({
    children
  }) => /*#__PURE__*/jsx_runtime_.jsx(GraphQLClientContext.Provider, {
    value: graphqlClient,
    children: children
  }); // Setup react query as network client


  const queryClient = new external_react_query_.QueryClient();

  const NetworkClientProvider = ({
    children
  }) => /*#__PURE__*/jsx_runtime_.jsx(GraphqlClientProvider, {
    children: /*#__PURE__*/jsx_runtime_.jsx(external_react_query_.QueryClientProvider, {
      client: queryClient,
      children: children
    })
  }); // Graphql operations


  const useGraphQLQuery = (query, _ref = {}) => {
    let {
      dataKey,
      variables = {}
    } = _ref,
        useQueryOptions = _objectWithoutProperties(_ref, _excluded);

    const gqlClient = useGraphQLClient();
    const queryKey = [dataKey, variables];
    const result = (0,external_react_query_.useQuery)(queryKey, queryFunctionFactory({
      gqlClient,
      query,
      variables,
      dataKey
    }), useQueryOptions);
    result.dataKey = dataKey;
    result.queryKey = queryKey;
    return result;
  };

  const useGraphQLConnectionQuery = (query, _ref2 = {}) => {
    let {
      dataKey,
      variables = {}
    } = _ref2,
        useInfiniteQueryOptions = _objectWithoutProperties(_ref2, _excluded2);

    const gqlClient = useGraphQLClient();
    const queryKey = [dataKey, variables];
    const result = (0,external_react_query_.useInfiniteQuery)(queryKey, queryFunctionFactory({
      gqlClient,
      query,
      variables,
      dataKey
    }), _objectSpread({
      getNextPageParam: getEndCursor
    }, useInfiniteQueryOptions));
    result.dataKey = dataKey;
    result.queryKey = queryKey;
    result.totalCount = computeTotalCount(result);
    return result;
  };

  const useGraphQLMutation = (mutation, _ref3 = {}) => {
    let {
      dataKey
    } = _ref3,
        useMutationOptions = _objectWithoutProperties(_ref3, _excluded3);

    const gqlClient = useGraphQLClient();
    const result = (0,external_react_query_.useMutation)(async variables => gqlClient.request(mutation, variables), useMutationOptions);

    const extractPayload = data => {
      var _ref4;

      return (_ref4 = data !== null && data !== void 0 ? data : result.data) === null || _ref4 === void 0 ? void 0 : _ref4[dataKey];
    };

    const validatePayload = data => {
      const payload = extractPayload(data);
      return resolvePayloadValidation(payload);
    };

    result.dataKey = dataKey;
    result.extractPayload = extractPayload;
    result.validatePayload = validatePayload;
    return result;
  };

  return {
    NetworkClientProvider,
    useGraphQLClient,
    useGraphQLQuery,
    useGraphQLConnectionQuery,
    useGraphQLMutation
  };
};

const {
  NetworkClientProvider,
  useGraphQLClient,
  useGraphQLQuery,
  useGraphQLConnectionQuery,
  useGraphQLMutation
} = establishClient(config/* default.api.graphqlUrl */.Z.api.graphqlUrl);
const {
  NetworkClientProvider: AdminNetworkClientProvider,
  useGraphQLClient: useAdminGraphqlClient,
  useGraphQLQuery: useAdminGraphQLQuery,
  useGraphQLConnectionQuery: useAdminGraphQLConnectionQuery,
  useGraphQLMutation: useAdminGraphQLMutation
} = establishClient(config/* default.api.graphqlAdminUrl */.Z.api.graphqlAdminUrl);
;// CONCATENATED MODULE: ./src/services/index.js



/***/ }),

/***/ 70109:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "LD": () => (/* binding */ RootStoreProvider),
  "oR": () => (/* binding */ useStore)
});

// UNUSED EXPORTS: useRootStore

// EXTERNAL MODULE: external "mobx"
var external_mobx_ = __webpack_require__(36211);
// EXTERNAL MODULE: external "react"
var external_react_ = __webpack_require__(16689);
// EXTERNAL MODULE: ./src/services/index.js + 2 modules
var services = __webpack_require__(59358);
// EXTERNAL MODULE: ./src/utils/env-utils.js
var env_utils = __webpack_require__(79143);
// EXTERNAL MODULE: external "date-fns"
var external_date_fns_ = __webpack_require__(74146);
// EXTERNAL MODULE: external "graphql-request"
var external_graphql_request_ = __webpack_require__(5805);
// EXTERNAL MODULE: ./src/domains/auth/fragments.js
var fragments = __webpack_require__(8489);
// EXTERNAL MODULE: ./src/utils/noops.js
var noops = __webpack_require__(6700);
// EXTERNAL MODULE: ./src/utils/type-utils.js
var type_utils = __webpack_require__(8636);
;// CONCATENATED MODULE: ./src/utils/date-utils.js


const asDate = x => {
  if ((0,external_date_fns_.isDate)(x)) return x;
  if ((0,external_date_fns_.isValid)(x)) return (0,external_date_fns_.toDate)(x);

  if ((0,type_utils/* isString */.HD)(x)) {
    const parsed = (0,external_date_fns_.parseISO)(x);
    if ((0,external_date_fns_.isDate)(parsed)) return parsed;
  }

  throw new Error(`Not a date: ${x}`);
};
const asDateOrFallback = (x, fallback = undefined) => {
  try {
    return asDate(x);
  } catch (_e) {
    return fallback;
  }
};
// EXTERNAL MODULE: ./src/stores/models/user-model.js + 1 modules
var user_model = __webpack_require__(70499);
;// CONCATENATED MODULE: ./src/stores/session-store.js
function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }








const REFRESH_GQL = external_graphql_request_.gql`
  ${fragments/* fragments.sessionPayloadFields */.P.sessionPayloadFields}
  mutation RefreshToken {
    refreshSessionToken {
      ...SessionPayloadFields
    }
  }
`;
const DATA_VERSION = 1;
const SESSION_DURATION_MINUTES = 10;
const ADMIN_ROLES = ['ADMIN', 'STAFF'];

class SessionStore {
  constructor(rootStore, localStorage, graphqlClient) {
    _defineProperty(this, "isLoading", true);

    _defineProperty(this, "user", void 0);

    _defineProperty(this, "token", void 0);

    _defineProperty(this, "createdAt", void 0);

    _defineProperty(this, "expiresAt", void 0);

    _defineProperty(this, "error", void 0);

    _defineProperty(this, "payloadErrors", []);

    _defineProperty(this, "dataVersion", void 0);

    (0,external_mobx_.makeAutoObservable)(this, {
      rootStore: false,
      localStorage: false,
      graphqlClient: false,
      _reAuthenticate: false
    });
    this.rootStore = rootStore;
    this.graphqlClient = graphqlClient;
    this.localStorage = localStorage; // Load session info from local storage

    this._reAuthenticate().then(noops/* NOOP */.dG);
  }

  async _reAuthenticate() {
    this._loading = true;

    try {
      const session = await this.localStorage.getSession();
      console.log('Loaded new session from local storage', session);
      this._session = session;

      if (session) {
        if (!this.user) {
          // Clear session if it is already expired
          await this.localStorage.removeSession();
        } else if (this.createdAt && (0,external_date_fns_.differenceInMinutes)(new Date(), this.createdAt) >= SESSION_DURATION_MINUTES || !session.dataVersion || session.dataVersion < DATA_VERSION) {
          await this.refreshSession();
        }
      }
    } catch (err) {
      console.error('Error loading user session', err);
    }

    this._loading = false;
  }

  get userIsLoggedIn() {
    return !this.isLoading && this.user && !this.sessionIsExpired;
  }

  get userCanAdmin() {
    return this.userIsLoggedIn && ADMIN_ROLES.includes(this.user.accountType);
  }

  get sessionIsExpired() {
    return this.expiresAt && (0,external_date_fns_.isPast)(this.expiresAt);
  }

  async refreshSession() {
    try {
      console.log('Refreshing session');
      this._loading = true;
      const data = await this.graphqlClient.request(REFRESH_GQL);
      await this.onNewSession(data.refreshSessionToken);
      return true;
    } catch (err) {
      this._handleError(err);

      return false;
    } finally {
      this._loading = false;
    }
  }

  async onNewSession(newSessionData) {
    try {
      const {
        successful,
        messages,
        result: session
      } = newSessionData;

      if (successful) {
        console.log('New session success');
        session.createdAt = new Date();
        session.dataVersion = DATA_VERSION;
        this._session = session;
        await this.localStorage.setSession(session);
      } else {
        console.log('New session payload errors', messages);
        this.payloadErrors = messages;
      }
    } catch (err) {
      console.error('New session exception', err);

      this._handleError(err);
    }
  }

  async onClearSession() {
    console.log('Clear session');

    try {
      this._session = null;
      await this.localStorage.removeSession();
    } catch (err) {
      this._handleError(err);
    }
  }

  onSessionError(error) {
    this._handleError(error);
  }

  set _loading(newVal) {
    this.isLoading = newVal;
    if (newVal) this._clearErrors();
  }

  set _session(session) {
    console.log('Session assigned', session);
    const {
      user,
      token,
      expiresAt,
      createdAt,
      dataVersion
    } = session || {};
    const expiresAtDate = asDateOrFallback(expiresAt);

    if (expiresAtDate && (0,external_date_fns_.isPast)(expiresAtDate)) {
      this.user = undefined;
      this.token = undefined;
      this.expiresAt = undefined;
      this.createdAt = undefined;
    } else {
      this.user = user_model/* default.wrap */.Z.wrap(user);
      this.token = token;
      this.expiresAt = expiresAtDate;
      this.createdAt = asDateOrFallback(createdAt);
      this.dataVersion = dataVersion || DATA_VERSION; // Update client with token header

      this.graphqlClient.setHeader('authorization', `Bearer ${token}`);
    }

    this._clearErrors();
  }

  _clearErrors() {
    this.payloadErrors = [];
    this.error = undefined;
  }

  _handleError(err) {
    console.error(err);
    this.error = err;
  }

}

/* harmony default export */ const session_store = (SessionStore);
;// CONCATENATED MODULE: ./src/stores/root-store.js


class RootStore {
  constructor(localStorage, graphqlClient) {
    this.sessionStore = new session_store(this, localStorage, graphqlClient);
  }

}

/* harmony default export */ const root_store = (RootStore);
// EXTERNAL MODULE: ./src/config/index.js + 3 modules
var config = __webpack_require__(405);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(20997);
;// CONCATENATED MODULE: ./src/stores/index.js





 // https://mobx.js.org/configuration.html


(0,external_mobx_.configure)({
  enforceActions: 'always',
  computedRequiresReaction: true,
  reactionRequiresObservable: true,
  observableRequiresReaction: true,
  disableErrorBoundaries: true
});
const StoreContext = /*#__PURE__*/(0,external_react_.createContext)(undefined);
const RootStoreProvider = ({
  children
}) => {
  const localStorage = (0,services/* useLocalStorage */._)();
  const graphqlClient = (0,services/* useGraphQLClient */.b_)();
  const rootStore = (0,external_react_.useMemo)(() => {
    const store = new root_store(localStorage, graphqlClient);

    if ((0,env_utils/* isClient */.C)() && config/* default.debug.enabled */.Z.debug.enabled) {
      window.rootStore = store;
    }

    return store;
  }, [localStorage, graphqlClient]);
  return /*#__PURE__*/jsx_runtime_.jsx(StoreContext.Provider, {
    value: rootStore,
    children: children
  });
};
const useRootStore = () => {
  const rootStore = (0,external_react_.useContext)(StoreContext);

  if (!rootStore) {
    throw new Error('useRootStore must be used within RootStoreProvider');
  }

  return rootStore;
};
const useStore = key => {
  var _useRootStore;

  return (_useRootStore = useRootStore()) === null || _useRootStore === void 0 ? void 0 : _useRootStore[`${key}Store`];
};

/***/ }),

/***/ 70499:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": () => (/* binding */ user_model)
});

// EXTERNAL MODULE: external "date-fns"
var external_date_fns_ = __webpack_require__(74146);
// EXTERNAL MODULE: external "mobx"
var external_mobx_ = __webpack_require__(36211);
// EXTERNAL MODULE: ./src/config/index.js + 3 modules
var config = __webpack_require__(405);
// EXTERNAL MODULE: ./src/utils/string-utils.js
var string_utils = __webpack_require__(453);
;// CONCATENATED MODULE: ./src/stores/models/attachment-model.js
function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }



class AttachmentModel {
  static wrap(plain, opts = {}) {
    if (!plain) return plain;
    if (Array.isArray(plain)) return plain.map(obj => this.wrap(obj, opts));
    return new this(plain, opts);
  }

  constructor(obj, opts = {}) {
    _defineProperty(this, "id", void 0);

    _defineProperty(this, "type", void 0);

    _defineProperty(this, "thumbnailAsset", void 0);

    const {
      observable = true
    } = opts;
    if (observable) (0,external_mobx_.makeAutoObservable)(this);
    this.fromPlain(obj, opts);
  }

  fromPlain(obj, _opts) {
    const attachment = obj.attachment || obj;
    Object.assign(this, attachment);
    const type = obj.profileAttachmentType;
    if (type) this.type = type;
    return this;
  }

}

/* harmony default export */ const attachment_model = (AttachmentModel);
;// CONCATENATED MODULE: ./src/stores/models/user-model.js
const _excluded = ["userAttachments"];

function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }

function user_model_defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }







class UserModel {
  static wrap(plain, opts = {}) {
    if (!plain) return plain;
    if (Array.isArray(plain)) return plain.map(obj => this.wrap(obj, opts));
    return new this(plain, opts);
  }

  constructor(obj, opts = {}) {
    user_model_defineProperty(this, "id", void 0);

    user_model_defineProperty(this, "accountType", void 0);

    user_model_defineProperty(this, "firstName", void 0);

    user_model_defineProperty(this, "lastName", void 0);

    user_model_defineProperty(this, "username", void 0);

    user_model_defineProperty(this, "dob", void 0);

    user_model_defineProperty(this, "pronoun", void 0);

    user_model_defineProperty(this, "countryCode", void 0);

    user_model_defineProperty(this, "followerCount", void 0);

    user_model_defineProperty(this, "lastSeenAt", void 0);

    user_model_defineProperty(this, "attachments", void 0);

    const {
      observable = true
    } = opts;
    if (observable) (0,external_mobx_.makeAutoObservable)(this);
    this.fromPlain(obj, opts);
  }

  fromPlain(obj, opts = {}) {
    const {
      userAttachments
    } = obj,
          rest = _objectWithoutProperties(obj, _excluded);

    Object.assign(this, rest);

    if (userAttachments) {
      this.attachments = attachment_model.wrap(userAttachments, opts);
    }

    return this;
  }

  get avatarLetters() {
    var _this$username, _this$username$charAt;

    return (_this$username = this.username) === null || _this$username === void 0 ? void 0 : (_this$username$charAt = _this$username.charAt(0)) === null || _this$username$charAt === void 0 ? void 0 : _this$username$charAt.toUpperCase();
  }

  get name() {
    return `${this.firstName || ''} ${this.lastName || ''}`.trim();
  }

  get dateOfBirth() {
    return this.dob ? (0,external_date_fns_.parseISO)(this.dob) : undefined;
  }

  get birthday() {
    return this.dob ? (0,external_date_fns_.format)(this.dateOfBirth, 'MMM d, y') : undefined;
  }

  get age() {
    return this.dob ? `${(0,external_date_fns_.differenceInYears)(new Date(), this.dateOfBirth)} years old` : undefined;
  }

  get pronounSymbol() {
    switch (this.pronoun) {
      case 'MALE':
        return '♂️(M)';

      case 'FEMALE':
        return '♀️(F)';

      default:
        return '';
    }
  }

  get avatarUrl() {
    if (this._avatarUrl === undefined) {
      var _this$getAttachmentOf, _this$getAttachmentOf2;

      const url = (_this$getAttachmentOf = this.getAttachmentOfType('AVATAR')) === null || _this$getAttachmentOf === void 0 ? void 0 : (_this$getAttachmentOf2 = _this$getAttachmentOf.thumbnailAsset) === null || _this$getAttachmentOf2 === void 0 ? void 0 : _this$getAttachmentOf2.url;
      this._avatarUrl = url || null;
    }

    return this._avatarUrl ? `${config/* default.services.imageServerUrl */.Z.services.imageServerUrl}${this._avatarUrl}` : undefined;
  }

  get coverUrl() {
    if (this._coverUrl === undefined) {
      var _this$getAttachmentOf3, _this$getAttachmentOf4;

      const url = (_this$getAttachmentOf3 = this.getAttachmentOfType('COVER')) === null || _this$getAttachmentOf3 === void 0 ? void 0 : (_this$getAttachmentOf4 = _this$getAttachmentOf3.coverAsset) === null || _this$getAttachmentOf4 === void 0 ? void 0 : _this$getAttachmentOf4.url;
      this._coverUrl = url || null;
    }

    return this._coverUrl ? `${config/* default.services.imageServerUrl */.Z.services.imageServerUrl}${this._coverUrl}` : undefined;
  }

  get countryFlagEmoji() {
    return this.countryCode ? (0,string_utils/* getFlagEmoji */.b)(this.countryCode) : undefined;
  }

  get lastSeenDate() {
    return this.lastSeenAt ? (0,external_date_fns_.parseISO)(this.lastSeenAt) : undefined;
  }

  get lastSeenDateText() {
    return this.lastSeenAt ? (0,external_date_fns_.format)(this.lastSeenDate, 'MMM d, y') : undefined;
  }

  getAttachmentOfType(type) {
    var _this$attachments;

    return (_this$attachments = this.attachments) === null || _this$attachments === void 0 ? void 0 : _this$attachments.find(a => a.type === type);
  }

}

/* harmony default export */ const user_model = (UserModel);

/***/ }),

/***/ 79143:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "s": () => (/* binding */ isServer),
/* harmony export */   "C": () => (/* binding */ isClient)
/* harmony export */ });
const isServer = () => true;
const isClient = () => false;

/***/ }),

/***/ 6700:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "dG": () => (/* binding */ NOOP),
/* harmony export */   "QO": () => (/* binding */ NOOP1),
/* harmony export */   "LT": () => (/* binding */ NOOP2)
/* harmony export */ });
const NOOP = () => {};
const NOOP1 = _ => {};
const NOOP2 = (_a, _b) => {}; // export const NOOP3 = (_a, _b, _c) => {};
// export const NOOP4 = (_a, _b, _c, _d) => {};
// export const NOOP5 = (_a, _b, _c, _d, _e) => {};

/***/ }),

/***/ 453:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "O": () => (/* binding */ humanize),
/* harmony export */   "b": () => (/* binding */ getFlagEmoji)
/* harmony export */ });
/* harmony import */ var inflection__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(64190);
/* harmony import */ var inflection__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(inflection__WEBPACK_IMPORTED_MODULE_0__);

const humanize = (str, {
  capitalizeFirst
} = {}) => {
  if (!str) return str;
  return (0,inflection__WEBPACK_IMPORTED_MODULE_0__.humanize)((0,inflection__WEBPACK_IMPORTED_MODULE_0__.underscore)(str), !capitalizeFirst);
};
const getFlagEmoji = str => {
  if (!str) return str;
  if (str.length !== 2) throw new Error(`Expected a two letter country code. Got: ${str}`);
  const codePoints = str.toUpperCase().split('').map(ch => 127397 + ch.charCodeAt());
  return String.fromCodePoint(...codePoints);
};

/***/ }),

/***/ 8636:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "HD": () => (/* binding */ isString),
/* harmony export */   "Kn": () => (/* binding */ isObject)
/* harmony export */ });
/* unused harmony exports isPlainObject, isObjectOrArray, isFunction, isPromise */
const isString = item => typeof item === 'string' || item instanceof String;
const isObject = item => item !== null && typeof item === 'object' && !Array.isArray(item);
const isPlainObject = item => item && item.constructor === {}.constructor;
const isObjectOrArray = item => item !== null && typeof item === 'object';
const isFunction = item => typeof item === 'function';
const isPromise = item => isObject(item) && typeof item.then === 'function';

/***/ })

};
;