public class Quran.HeaderBar : Gtk.HeaderBar {

	construct {
		set_show_close_button(true);
		set_title("القرآن الكريم");
	
		var menu_button = new Gtk.Button.from_icon_name("edit-find");

		pack_start(menu_button);
	}
}
