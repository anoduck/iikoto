// License: MIT

function quote(no) {
  var postForm = document.querySelector("[name='body']");
  postForm.value += (">>" + no + "\n");
}
