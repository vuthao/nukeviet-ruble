require 'ruble'

bundle do |bundle|
  bundle.display_name = 'NukeViet'
  bundle.author = 'Vu Thao'
  bundle.copyright = <<END
(c) Copyright 2013 VINADES.,JSC. Distributed under GNU license.
END

  bundle.description = <<END
Sample description
END

  bundle.repository = 'git@github.com:nukeviet/nukeviet-ruble.git'

  # Use Commands > Bundle Development > Insert Bundle Section > Menu
  # to easily add new sections
  bundle.menu 'NukeViet' do |menu|
    menu.menu 'Templates' do |sub_menu|
        sub_menu.command 'File Head'
        sub_menu.command 'PHP Module'
        sub_menu.command 'PHP Module Admin'
        sub_menu.command 'PHP Language'
    end
    menu.menu 'Code PHP' do |sub_menu|
        sub_menu.command 'Code PHP 1'
        sub_menu.command 'Code PHP 2'
        sub_menu.command 'Code PHP 3'
    end
  end
end