if typeof String::contains != 'function'
  String::contains = (key) ->
    this.indexOf(key) != -1
