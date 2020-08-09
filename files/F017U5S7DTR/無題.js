Object.defineProperty(exports, "VimHelp", { enumerable: true, get: function () { return vimhelp_1.VimHelp; } });
var plugin_manager_1 = __webpack_require__(4);
Object.defineProperty(exports, "PluginManager", { enumerable: true, get: function () { return plugin_manager_1.PluginManager; } });


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.VimHelp = void 0;
const exec_vim_1 = __webpack_require__(2);
class VimHelp {
    constructor(vimBin = "vim") {
        this.vimBin = vimBin;
        this.vimBin = vimBin;
        this.helplang = [];
    }
    search(word) {
        var _a;
        const safeWord = word.replace(/\|/g, "bar");
        const commands = [
            `verbose silent help ${safeWord}`,
            [
                "?\\%(^\\s*$\\|[^*]$\\)?",
                "/\\*\\S\\+\\*/",
                ";",
                "/^*\\|[^*]$/",
                "-1",
                "/^\\s*\\*\\S\\+\\*\\|\\*\\S\\+\\*\\s*\\%(>\\)\\=$/",
                "?^[^=-].*[^=-]$?",
                "print"
            ].join("")
        ];
        const runtimepaths = ((_a = this.rtpProvider) === null || _a === void 0 ? void 0 : _a.call(this)) || [];
        const preCommands = runtimepaths.map((rtp) => `set runtimepath+=${rtp.replace(/[\\, ]/, "\\\0")}`);
        preCommands.push(`set helplang=${this.helplang.join(",")}`);
        return this._execVim(preCommands.concat(commands));
    }
    _execVim(commands) {
        return exec_vim_1.execVim(this.vimBin, [...commands, "qall!"]);
    }
    setRTPProvider(provider) {
        this.rtpProvider = provider;
    }
}
exports.VimHelp = VimHelp;