public class Majeed.Layout.HeaderBar : Gtk.HeaderBar {
	public Gtk.Stack window_stack {get; construct;}
	public Gtk.Popover menu_button_popover;
	public HeaderBar(Gtk.Stack stack) {
		Object(window_stack: stack);
	}

	construct {
		set_show_close_button(true);
		var menu_button = new Gtk.Button.from_icon_name("open-menu-symbolic");
		menu_button.valign = Gtk.Align.CENTER;
		var fullscreen_button = new Gtk.Button.from_icon_name("view-fullscreen-symbolic");
		fullscreen_button.set_tooltip_text("التحول إلى ملء الشاشة");
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
		set_custom_title(stack_switcher);
		stack_switcher.set_direction(Gtk.TextDirection.RTL);


		pack_end(menu_button);
		pack_end(fullscreen_button);
		pack_end(find_button);
		pack_start(copy_button);
		pack_start(jump_button);


		// menu_button popover
		menu_button_popover = new Gtk.Popover(menu_button);
		menu_button_popover.set_modal(true);
		var vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
		vbox.pack_start(new Gtk.Label("Quit"));
		vbox.pack_start(new Gtk.Label("Quit2"));
		vbox.pack_start(new Gtk.Label("Quit3"));
		menu_button_popover.add(vbox);
		menu_button_popover.set_position(Gtk.PositionType.BOTTOM);
		menu_button.clicked.connect(menu_button_clicked);
	}

	public void menu_button_clicked() {
		this.menu_button_popover.popup();
	}
}
