<template>
  <div id="user-form" v-cloak>
    <form>
      <div class="form-group"
        :class="{'has-error': hasErrorOn('name')}">
        <label for="user_name" class="control-label">お名前</label>
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
      <div class="form-group" v-show="user.language === 'other'"
        :class="{'has-error': hasErrorOn('other_language')}">
        <label for="user_other_language" class="control-label">（具体的に）</label>
        <input style="display: inline; width: auto" class="form-control"
          v-model="user.other_language" type="text" name="user[other_language]">
      </div>

      <span class="btn btn-primary" @click="submit()">{{buttonLabel}}</span>
    </form>
  </div>
</template>

<script>
module.exports = {
  data: function() {
    return {
      user_id: undefined,
      user: {
        name: "",
        language: "",
        other_language: ""
      },
      errors: {}
    }
  },
  mounted: function() {
    const md = window.location.pathname.match(/\/users\/(\d+)\/edit/)
    if (md) {
      let _this = this
      this.user_id = md[1]
      this.$axios.get(`/users/${this.user_id}`)
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
      return this.user_id ? "更新" : "登録"
    }
  },
  methods: {
    submit: function() {
      let _this = this
      let handler = function(response) {
        if (response.data.result === "OK") {
          window.location.pathname = "/users"
        }
        else {
          _this.errors = response.data.errors
        }
      }
      if (this.user_id) {
        this.$axios.patch(`/users/${_this.user_id}`, _this.user)
          .then(handler)
          .catch(function(error) {
            console.log(error)
          })
      }
      else {
        this.$axios.post("/users", this.user)
          .then(handler)
          .catch(function(error) {
            console.log(error)
          })
      }
    },
    hasErrorOn: function(field) {
      return this.errors[field] && this.errors[field].length > 0
    }
  }
}
</script>
