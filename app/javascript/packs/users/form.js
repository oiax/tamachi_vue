import Vue from 'vue/dist/vue.esm'
import UsersForm from '../../components/users/form.vue'

Vue.config.productionTip = false

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#user-form",
    template: "<UsersForm/>",
    components: { UsersForm }
  })
})
