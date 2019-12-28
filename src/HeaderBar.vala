public class Majeed.HeaderBar : Gtk.HeaderBar {

	construct {
		set_show_close_button(true);
		set_title("القرآن الكريم");
	
		var menu_button = new Gtk.Button.from_icon_name("open-menu");
		var copy_button = new Gtk.Button.from_icon_name("edit-copy");
		var jump_button = new Gtk.Button.from_icon_name("go-jump");
		
		pack_start(menu_button);
		pack_start(copy_button);
		pack_start(jump_button);
	}
}
