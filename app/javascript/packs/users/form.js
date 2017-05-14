import Vue from 'vue/dist/vue.esm'

Vue.config.productionTip = false

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: "#user-form",
    data: {
      user: {
        name: "",
        language: undefined,
        other_language: ""
      }
    }
  })
})
