public class Majeed.Layout.HeaderBar : Gtk.HeaderBar {
    private Majeed.About about_dialog;
    private Majeed.Preferences preferences_dialog;
    public Gtk.Window main_window {get; construct;}
    public Gtk.Stack window_stack {get; construct;}
    public Gtk.Popover menu_button_popover;
    private Gtk.Box vbox;

    public HeaderBar(Gtk.Window window, Gtk.Stack stack) {
        Object(
            main_window: window,
            window_stack: stack
            );
    }


    
    construct {
        set_show_close_button(true);
        var open_menu = new Gtk.MenuButton();
        open_menu.set_image (new Gtk.Image.from_icon_name("open-menu-symbolic", Gtk.IconSize.BUTTON));
        open_menu.tooltip_text = "قائمة";
        var find_button = new Gtk.Button.from_icon_name("edit-find-symbolic");
        find_button.set_tooltip_text("البحث");
        var copy_button = new Gtk.Button.from_icon_name("edit-copy");
        copy_button.valign = Gtk.Align.CENTER;
        copy_button.set_tooltip_text("نسخ");
        var jump_button = new Gtk.Button.from_icon_name("go-jump");
        jump_button.valign = Gtk.Align.CENTER;
        jump_button.set_tooltip_text("الانتقال إلى");

        var stack_switcher = new Gtk.StackSwitcher();
        stack_switcher.stack = window_stack;
        stack_switcher.valign = Gtk.Align.FILL;
        set_custom_title(stack_switcher);
        stack_switcher.set_direction(Gtk.TextDirection.RTL);


        pack_end(open_menu);
        pack_end(find_button);
        pack_start(copy_button);
        pack_start(jump_button);


        // menu_button popover
        var menu_popover = new Gtk.Popover(open_menu);
        menu_popover.set_modal(true);


        Gtk.ModelButton fullscreen_button = new Gtk.ModelButton ();
        fullscreen_button.label = "ملء الشاشة";
        Gtk.Label fullscreen_label = fullscreen_button.get_child() as Gtk.Label;

        Gtk.ModelButton preferences_button = new Gtk.ModelButton ();
        preferences_button.label = "اﻹعدادات";
        Gtk.Label preferences_label = preferences_button.get_child() as Gtk.Label;
        preferences_button.clicked.connect (on_preferences);

        Gtk.ModelButton keyboard_shortcuts_button = new Gtk.ModelButton ();
        keyboard_shortcuts_button.label = "اختصارات لوحة المفاتيح";
        Gtk.Label keyboard_shortcuts_label = keyboard_shortcuts_button.get_child() as Gtk.Label;

        Gtk.ModelButton about_button = new Gtk.ModelButton ();
        about_button.label = "حول";
        Gtk.Label about_label = about_button.get_child() as Gtk.Label;
        about_button.clicked.connect (on_about);


        var menu_grid = new Gtk.Grid ();
        menu_grid.margin_top = 12;
        menu_grid.margin_bottom = 3;
        menu_grid.orientation = Gtk.Orientation.VERTICAL;
        menu_grid.attach (fullscreen_button, 0, 3, 3, 1);
        menu_grid.attach (preferences_button, 0, 4, 3, 1);
        menu_grid.attach (keyboard_shortcuts_button, 0, 5 , 3, 1);
        menu_grid.attach (about_button, 0, 6, 3, 1);
        menu_grid.show_all ();
        menu_grid.expand = true;

        menu_popover.add (menu_grid);
        open_menu.popover = menu_popover;
        open_menu.valign = Gtk.Align.CENTER;

    }

    private void on_about () {
        about_dialog = new Majeed.About(main_window);
        about_dialog.present ();
    }

    private void on_preferences () {
        preferences_dialog = new Majeed.Preferences(main_window);
        preferences_dialog.present ();

    }

}
