function(){
    return{
        get_int: function () {  return 10;  },
        get_random: function() { return Math.floor((100) * Math.random()); },
        get_str: function (arg) {  return "hello: " + arg;  }
    }
}