@menus.each do |menu|
    json.set! menu.id do 
        json.partial! 'menu', menu: menu
    end
end