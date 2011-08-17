module Hardware
    autoload :Components, "hardware/components"

    ComponentLib=ENV["HWComponentsDir"]
    $:.push ComponentLib

end
