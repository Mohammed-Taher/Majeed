public class Majeed.Layout.Window : Gtk.ApplicationWindow {
    public GLib.Settings settings;
    private Majeed.Layout.HeaderBar headerbar;
    private Gtk.Stack header_stack;
    private Majeed.Layout.Pane pane;
    public int width;
    public int height;
    public int x;
    public int y;

    public Window(Application application) {
        Object (
            application: application,
            title: "Majeed",
            window_position: Gtk.WindowPosition.CENTER
            
            );
    }

    construct {
        set_default_size(900, 600);
        // Main Layout
        pane = new Pane(width);
        

        // End Main Layout

        // Header Bar
        header_stack = new Gtk.Stack();
        header_stack.expand = true;
        var recitation = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        recitation.pack_start(pane);
        var editing = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        header_stack.add_titled(recitation, "Recitation", "المصحف");
        header_stack.add_titled(editing, "editing", "التفسير");
        add(header_stack);
        headerbar = new Majeed.Layout.HeaderBar(header_stack);
        this.set_titlebar(headerbar);
        // End Header Bar



        // Window Settings
        settings = new GLib.Settings("com.github.Mohammed-Taher.majeed");
        move(settings.get_int("pos-x"), settings.get_int("pos-y"));
        resize(settings.get_int("window-width"), settings.get_int("window-height"));

        delete_event.connect(e => {
            return before_destroy();
        });
        show_all();
    }

    public bool before_destroy() {
        
        get_size(out width, out height);
        get_position(out x, out y);

        settings.set_int("pos-x", x);
        settings.set_int("pos-y", y);
        settings.set_int("window-width", width);
        settings.set_int("window-height", height);

        return false;
    }
}
