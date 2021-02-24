public class Majeed.Preferences : Gtk.Dialog {

    public Gtk.Window parent_window {get; construct;}

    public Preferences(Gtk.Window window) {
        Object(
            parent_window : window

            );
    }

    construct {
        set_transient_for(parent_window);
        set_modal (true);
        set_default_size(640, 480);
        set_title("اﻹعدادات");
        Gtk.Label label = new Gtk.Label("اﻹعدادات");
        var box = this.get_content_area();
        box.add(label);
        show_all();

    }

}
