<template>
  <div id="user-form" v-cloak>
    <form>
      <div class="form-group">
        <label for="user_name">お名前</label>
        <input class="form-control" style="width: 300px" v-model="user.name"
          type="text" name="user[name]">
      </div>
      <div class="form-group">
        <label for="user_language">もっとも得意なプログラミング言語</label>
        <div>
          <label>
            <input v-model="user.language" type="radio" value="ruby"
              name="user[language]"> Ruby
          </label>
          <label>
            <input v-model="user.language" type="radio" value="php"
              name="user[language]"> PHP
          </label>
          <label>
            <input v-model="user.language" type="radio" value="other"
              name="user[language]"> その他
          </label>
        </div>
      </div>
      <div class="form-group" v-show="user.language === 'other'">
        <label for="user_other_language">（具体的に）</label>
        <input style="display: inline; width: auto" class="form-control"
          v-model="user.other_language" type="text" name="user[other_language]">
      </div>

      <span class="btn btn-primary">{{buttonLabel}}</span>
    </form>
  </div>
</template>

<script>
module.exports = {
  data: function() {
    return {
      user: {
        name: "",
        language: "",
        other_language: "",
        id: undefined
      }
    }
  },
  mounted: function() {
    const md = window.location.pathname.match(/\/users\/(\d+)\/edit/)
    if (md) {
      let _this = this
      this.user.id = md[1]
      this.$axios.get(`/users/${this.user.id}`)
        .then(function(response) {
          _this.user = response.data
        })
        .catch(function(error) {
          console.log(error)
        })
    }
  },
  computed: {
    buttonLabel: function() {
      return this.user.id ? "更新" : "登録"
    }
  }
}
</script>
