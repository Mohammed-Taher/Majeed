public class Majeed.TextView : Gtk.TextView {
    private Gtk.TextTagTable tagTable;
    private Gtk.TextBuffer textBuffer;
    private Gtk.TextTag amiriFont;
    private Gtk.TextIter start;
    private Gtk.TextIter end;

    construct {
        //  set_editable(false);
        set_wrap_mode(Gtk.WrapMode.WORD);
        tagTable = new Gtk.TextTagTable();
        textBuffer = new Gtk.TextBuffer(tagTable);
        textBuffer.set_text("بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ");
		amiriFont = new Gtk.TextTag();
		amiriFont = textBuffer.create_tag(null, "font", "Amiri Quran 30");
		textBuffer.get_bounds(out start, out end);
        textBuffer.apply_tag(amiriFont, start, end);
        textBuffer.changed.connect(updateTextView);
        set_buffer(textBuffer);
    }

    public void updateTextView() {
        textBuffer.get_bounds(out start, out end);
        textBuffer.apply_tag(amiriFont, start, end);
    }
}