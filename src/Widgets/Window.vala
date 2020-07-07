public class Majeed.Window : Gtk.ApplicationWindow {
	public GLib.Settings settings;
	public Window(Application application) {
		Object (
			application: application
			);
		}
	
	construct {
		title = "Majeed";
		window_position = Gtk.WindowPosition.CENTER;
		set_default_size(900, 600);
		var headerbar = new Majeed.HeaderBar();
		this.set_titlebar(headerbar);

		var scrollWindow = new Gtk.ScrolledWindow(null, null);
		var mainText = new Majeed.TextView();
		
		scrollWindow.add(mainText);
		this.add(scrollWindow);

		settings = new GLib.Settings("com.github.Mohammed-Taher.majeed");
		
		move(settings.get_int("pos-x"), settings.get_int("pos-y"));
		resize(settings.get_int("window-width"), settings.get_int("window-height"));

		delete_event.connect(e => {
			return before_destroy();
		});
		show_all();
	}

	public bool before_destroy() {
		int width, height, x, y;
		get_size(out width, out height);
		get_position(out x, out y);

		settings.set_int("pos-x", x);
		settings.set_int("pos-y", y);
		settings.set_int("window-width", width);
		settings.set_int("window-height", height);

		return false;
	}
}
