module Hardware
  class Components
    def self.list
      Dir.glob(Hardware::ComponentLib+"/*.rb") .each { |s|
        s.gsub! /#{Hardware::ComponentLib}\/(.*).rb/, '\1'
      }
    end
    def self.run component,attribute
require component
      Kernel.const_get(component.capitalize).new.send(attribute)
    end
  end
end
