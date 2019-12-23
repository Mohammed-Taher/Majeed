public class Application : Gtk.Application {

	public Application() {
		Object(
			application_id: "com.github.Mohammed-Taher.quran",
			flags: ApplicationFlags.FLAGS_NONE
			);
	}

	protected override void activate () {
		var window = new Quran.Window(this);

		add_window(window);
	}
}
