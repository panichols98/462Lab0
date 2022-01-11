ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    shares hello, monkey
  }

  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }

    monkey = function(name) {
      end => name | "Monkey"
      str = "Hello " + end
      str
    }
  }

  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }

  rule hello_world2 {
    select when echo monkey
    pre {
      name = event:attr{"name"} || "Monkey"
    }
    send_directive("say", {"something": "Hello " + name})
  }

}
