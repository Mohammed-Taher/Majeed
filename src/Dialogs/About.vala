public class Majeed.About : Gtk.AboutDialog {
    public Gtk.Window parent_window {get; construct;}
    public About(Gtk.Window window) {
        Object(
            parent_window: window            
            );
    }
    construct {
        set_destroy_with_parent (true);
        set_transient_for (parent_window);
        set_modal (true);
        set_license_type (Gtk.License.GPL_3_0);
        
        wrap_license = true;
        authors = {"Mohammed Taher"};
        artists = {"Mohammed Taher"};

        program_name = "Majeed";
        comments = "Quran Browsing Program for Gnome";
        version = "0.0.1";
        logo = new Gdk.Pixbuf.from_file("../Majeed-icon.png");

        

        response.connect ((response_id) => {
            if (response_id == Gtk.ResponseType.CANCEL || response_id == Gtk.ResponseType.DELETE_EVENT) {
                this.hide_on_delete ();
            }
        }); 
    }
}
