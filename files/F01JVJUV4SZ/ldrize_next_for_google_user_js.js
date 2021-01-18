// ==UserScript==
// @name         LDRize Next for Google
// @namespace    https://github.com/yuki-ycino
// @version      0.3
// @author       Yuki Yano, takker
// @include       /^https://www.google.com/search?.*/
// ==/UserScript==

class Manager {
  constructor() {
    this.cursor = 0;
    this.searchResult = [];
    this.started = false;
  }

  start() {
    if (this.started) return;
    // div.gが読み込まれたら初期化を開始する
    const timer = setInterval(() => {
      if (document.querySelectorAll("div.g").length === 0) return;
      this.updateItems();
      this.target.select();
      document.addEventListener("keydown", (event) => {
        // search barにfocusがあたっていたら何もしない
        const searchBar = document.querySelector("input[class]");
        if (document.activeElement === searchBar) {
          if(event.key === "Escape"
            || (event.key === "[" && event.ctrlKey)) {
            searchBar.blur();
            return false;
          }
          return true;
        }
        switch (event.key) {
          case "i":
            event.preventDefault();
            event.stopPropagation();
            searchBar.focus();
            break;
          case "j":
            this.selectNext();
            break;
          case "k":
            this.selectPrev();
            break;
          case "o":
            this.open({newTab: true});
            break;
          case "v":
            this.open();
            break;
          case "p":
            this.togglePin();
            break;
        }
        return false;
      });
      clearInterval(timer);
    }, 100);
    this.started = true;
  }

  get target() {
    return this.searchResult[this.cursor];
  }
  get next() {
    return this.searchResult[this.cursor + 1];
  }
  get prev() {
    return this.searchResult[this.cursor - 1];
  }
  selectNext() {
    if (this.next) {
      this.target.deselect();
      this.cursor++;
      this.target.select();
    } else {
      // リストの末尾のときは再読込する
      this.updateItems();
    }
    this.target.scrollIntoView(true);
    window.scrollBy(0, -400);
  }
  selectPrev() {
    // 前にリンクがあるときのみ戻る
    if (this.prev) {
      this.target.deselect();
      this.cursor--;
      this.target.select();
    }
    this.target.scrollIntoView(true);
    window.scrollBy(0, -400);
  }
  open({newTab = false} = {}) {
    if(!newTab) {
      document.location.href = this.target.link;
      return;
    }
    const pinItems = this.getPinItems();
    if (pinItems.length === 0) {
      window.open(this.target.link);
    } else {
      pinItems.forEach(item => {
        window.open(item.link);
      });
    }
  }
  togglePin() {
    this.target.togglePin();
    // 次に進む
    this.selectNext();
  }
  updateItems() {
    this.searchResult = [...document.querySelectorAll("div.g")].filter(
        (item) => item.classList.contains("g")
      ).map(item => new searchItem(item));
  }
  getPinItems() {
    return this.searchResult.filter(item => item.pinned);
  }
}
class searchItem {
  constructor(element) {
    if (element?.match?.("div.g")) throw Error("An invalid element");
    this._element = element;
    this._selected = false;
    this._pinned = false;
  }

  get pinned() {
    return this._pinned;
  }
  get selected() {
    return this._selected;
  }

  get link() {
    return this._element.getElementsByTagName("div")?.[0]?.getElementsByTagName("a")?.[0]?.href;
  }

  togglePin() {
    if (!this.pinned) {
      this._element.style.borderLeft = "#E4645C 4px solid";
      this._element.style.paddingLeft = "4px";
      this._pinned = true;
    } else {
      this._element.style.borderLeft = "";
      this._element.style.paddingLeft = "";
      // borderを設定し直す
      if (this.selected) this._element.style.border = "#C4E6F8 2px solid";
      this._pinned = false;
    }
  }
  pin() {
    if (this.pinned) return;
    this.togglePin();
  }
  unpin() {
    if (!this.pinned) return;
    this.togglePin();
  }
  select() {
    if (this.selected) return;
    this._element.style.background = "#EFF4F8";
    this._element.style.border = "#C4E6F8 2px solid";
    // border-leftを設定し直す
    if (this.pinned) this._element.style.borderLeft = "#E4645C 4px solid";
    this._selected = true;
  }
  deselect() {
    if (!this.selected) return;
    this._element.style.background = "";
    this._element.style.border = "";
    // border-leftを設定し直す
    if (this.pinned) this._element.style.borderLeft = "#E4645C 4px solid";
    this._selected = false;
  }
  clear(){
    this._element.style = "";
  }
  scrollIntoView() {
    this._element.scrollIntoView(true);
  }
}

(() => {
  "use strict";
  const manager = new Manager();
  manager.start();
})();
