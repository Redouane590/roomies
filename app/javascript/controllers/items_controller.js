import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "check", "form" ]
  // toggle(event) {
  //   let formData = new FormData()
  //   formData.append("item[completed]", this.completedTarget.checked);
  //   fetch(this.data.get("update-url"), {
  //     body: formData,
  //     method: 'PATCH',
  //     dataType: 'script',
  //     credentials: "include",
  //     headers: {"X-CSRF-Token": getMetaValue("csrf-token")}
  //         })
  //      .then(function(response) {
  //       if (response.status != 204) {
  //           event.target.checked = !event.target.checked}
  //       })
  //     }

      chec(event) {
        event.preventDefault()

        this.formTarget.submit()




      }


      connect() {
        console.log("Hello World!")


      }




    }
