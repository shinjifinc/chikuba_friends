@change_page = (event, id) ->
  $.ajax
    async:    true
    url: '/questionnaires/form_response'
    type: 'GET'
    data: { stay_id: id }
    dataType: "json"
    context:  this
    success: (data) ->
      i = 1
      while i <= 4
        if String(i) != String(id)
          # hoge = "#questions"+i
          # $(hoge).fadeOut("normal")
          hoge = document.getElementById("questions"+i)
          hoge.innerHTML = data.contents["new_data#{i}"]
          # alert(data.contents["new_data#{i}"])
        i++
  return
