public class Application : Gtk.Application {

	public Application() {
		Object(
			application_id: "com.github.Mohammed-Taher.majeed",
			flags: ApplicationFlags.FLAGS_NONE
			);
	}

	protected override void activate () {
		var window = new Majeed.Window(this);

		add_window(window);
	}
}
