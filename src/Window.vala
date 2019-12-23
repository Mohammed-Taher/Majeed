public class Quran.Window : Gtk.ApplicationWindow {
	public Window(Application application) {
		Object (
			application: application
			);
	}

	construct {
		title = "القرآن الكريم";
		window_position = Gtk.WindowPosition.CENTER;
		set_default_size(900, 600);
		var headerbar = new Quran.HeaderBar();
		this.set_titlebar(headerbar);
		show_all();
	}
}
