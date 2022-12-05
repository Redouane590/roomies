import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="iframe-style"
export default class extends Controller {
  connect() {
    console.log("hello")
    let doc = this.element.contentDocument;
    const style = "<style> .ui-rtsr { background-color: #FFFDF6 !important; color: black !important; }</style>";
    doc.body.innerHTML = doc.body.innerHTML + style
    console.log(doc)
  }
}


// window.onload = function() {
//   let myiFrame = document.getElementById("myiFrame");
//   let doc = myiFrame.contentDocument;
//   doc.body.innerHTML = doc.body.innerHTML + '<style>/******* Put your styles here *******</style>';
// }
