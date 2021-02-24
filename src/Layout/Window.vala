public class Majeed.Layout.Window : Gtk.ApplicationWindow {
    [Signal (action = true)]
    private signal void on_fullscreen();
    [Signal (action = true)]
    private signal void on_unfullscreen();

    public GLib.Settings settings;
    private Majeed.Layout.HeaderBar headerbar;
    private Gtk.Stack header_stack;
    private Majeed.Layout.Pane pane;
    public Goo.Canvas quran_canvas;
    public int width;
    public int height;
    public int x;
    public int y;
    public Gtk.Image image;

    public Window(Application application) {
        Object (
            application: application,
            title: "Majeed",
            window_position: Gtk.WindowPosition.CENTER

            );
    }

    construct {
        this.init_keyboard_shortcuts();
        Gtk.Box vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        set_default_size(900, 600);

        // Header Bar
        header_stack = new Gtk.Stack();
        header_stack.expand = true;
        var recitation = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        recitation.pack_start(pane);
        var editing = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        header_stack.add_titled(recitation, "Recitation", "المصحف");
        header_stack.add_titled(editing, "editing", "أدوات التحرير");
        add(header_stack);
        headerbar = new Majeed.Layout.HeaderBar(this, header_stack);
        this.set_titlebar(headerbar);
        // End Header Bar


        // Main Layout

        // End Main Layout


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
    

    
    private void init_keyboard_shortcuts () {
        Gtk.AccelGroup accel_group = new Gtk.AccelGroup ();
        this.add_accel_group (accel_group);

        this.on_fullscreen.connect ( () => {
            this.fullscreen();
        });

        this.on_unfullscreen.connect ( () => {
            this.unfullscreen();
        });
        
        this.add_accelerator("on_fullscreen", accel_group, Gdk.keyval_from_name("l"), Gdk.ModifierType.CONTROL_MASK, Gtk.AccelFlags.VISIBLE);
        this.add_accelerator("on_unfullscreen", accel_group, Gdk.keyval_from_name("r"), Gdk.ModifierType.CONTROL_MASK, Gtk.AccelFlags.VISIBLE);
    }
}
