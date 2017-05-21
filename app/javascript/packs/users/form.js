import Vue from 'vue/dist/vue.esm'
import UsersForm from '../../components/users/form.vue'
import axios from "axios"

Vue.config.productionTip = false
Vue.prototype.$axios = axios

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#user-form",
    template: "<UsersForm/>",
    components: { UsersForm }
  })
})
