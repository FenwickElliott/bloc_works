require "bloc_works/version"
require "bloc_works/dependencies"
require "bloc_works/controller"
require "bloc_works/router"
require "bloc_works/utility"

module BlocWorks
  class Application
    def call(env)
      controller_class, action = controller_and_action(env)
      cont = controller_class.new(env)
      res = cont.send(action)
      
      [200, {'Content-Type' => 'text/html'}, [res]]
    end
  end
end