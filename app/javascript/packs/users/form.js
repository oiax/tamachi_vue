import Vue from "vue/dist/vue.esm"
import TurbolinksAdapter from 'vue-turbolinks'
import VueDataScooper from "vue-data-scooper"

Vue.config.productionTip = false
Vue.use(VueDataScooper)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: "#user-form",
    mixins: [TurbolinksAdapter]
  })
})
