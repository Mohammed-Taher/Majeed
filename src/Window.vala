public class Majeed.Window : Gtk.ApplicationWindow {
	public Window(Application application) {
		Object (
			application: application
			);
		}
	
	construct {
		title = "القرآن الكريم";
		window_position = Gtk.WindowPosition.CENTER;
		set_default_size(900, 600);
		var headerbar = new Majeed.HeaderBar();
		this.set_titlebar(headerbar);

		var scrollWindow = new Gtk.ScrolledWindow(null, null);
		var mainText = new Majeed.TextView();
		
		scrollWindow.add(mainText);
		this.add(scrollWindow);
		show_all();
	}
}
