$(document).on("turbolinks:load", function() {
  if ($("#user-form").length) {
    function toggleOtherLanguage() {
      var language = $("input[name='user[language]']:checked").val()
      var div = $("input[name='user[other_language]']").parent()
      div.toggle(language === "other")
    }

    toggleOtherLanguage()

    $("input[name='user[language]']").on("click", function() {
      toggleOtherLanguage()
    })
  }
})
