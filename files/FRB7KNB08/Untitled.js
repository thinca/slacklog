  function escapeHTML(html) {
    const dummy = document.createElement('dummy');
    const text = document.createTextNode(html);
    dummy.appendChild(text);
    return dummy.innerHTML;
  }
  console.log(escapeHTML('<script>alert("hello");</script>'));  // => "&lt;script&gt;alert("hello");&lt;/script&gt;"