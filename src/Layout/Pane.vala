public class Majeed.Layout.Pane : Gtk.Paned {

    private Gtk.ScrolledWindow ayat_scrolled_window;
    private Gtk.ScrolledWindow treeview_scrolled_window;
    private Gtk.TextView quran_text_view;
    private Gtk.TreeView ayat_tree_view;
    private Gtk.TreeView soura_tree_view;
    private Gtk.TreeViewColumn soura_list_column;
    private Gtk.TreeViewColumn ayat_list_column;
    private Gtk.TreeStore soura_tree_store;
    private Gtk.TreeStore ayat_tree_store;

    protected string[] souras = {"سورة الفاتحة", "سورة البقرة", "سورة آل عمران", "سورة النساء", "سورة المائدة", "سورة الأنعام", "سورة الأعراف", "سورة الأنفال", "سورة التوبة", "سورة يونس", "سورة هود", "سورة يوسف", "سورة الرعد", "سورة إبراهيم", "سورة الحجر", "سورة النحل", "سورة الإسراء", "سورة الكهف", "سورة مريم", "سورة طه", "سورة الأنبياء", "سورة الحج", "سورة المؤمنون", "سورة النّور", "سورة الفرقان", "سورة الشعراء", "سورة النّمل", "سورة القصص", "سورة العنكبوت", "سورة الرّوم", "سورة لقمان", "سورة السجدة", "سورة الأحزاب", "سورة سبأ", "سورة فاطر", "سورة يس", "سورة الصافات", "سورة ص", "سورة الزمر", "سورة غافر", "سورة فصّلت", "سورة الشورى", "سورة الزخرف", "سورة الدّخان", "سورة الجاثية", "سورة الأحقاف", "سورة محمد", "سورة الفتح", "سورة الحجرات", "سورة ق", "سورة الذاريات", "سورة الطور", "سورة النجم", "سورة القمر", "سورة الرحمن", "سورة الواقعة", "سورة الحديد", "سورة المجادلة", "سورة الحشر", "سورة الممتحنة", "سورة الصف", "سورة الجمعة", "سورة المنافقون", "سورة التغابن", "سورة الطلاق", "سورة التحريم", "سورة الملك", "سورة القلم", "سورة الحاقة", "سورة المعارج", "سورة نوح", "سورة الجن", "سورة المزّمّل", "سورة المدّثر", "سورة القيامة", "سورة الإنسان", "سورة المرسلات", "سورة النبأ", "سورة النازعات", "سورة عبس", "سورة التكوير", "سورة الإنفطار", "سورة المطفّفين", "سورة الإنشقاق", "سورة البروج", "سورة الطارق", "سورة الأعلى", "سورة الغاشية", "سورة الفجر", "سورة البلد", "سورة الشمس", "سورة الليل", "سورة الضحى", "سورة الشرح", "سورة التين", "سورة العلق", "سورة القدر", "سورة البينة", "سورة الزلزلة", "سورة العاديات", "سورة القارعة", "سورة التكاثر", "سورة العصر", "سورة الهمزة", "سورة الفيل", "سورة قريش", "سورة الماعون", "سورة الكوثر", "سورة الكافرون", "سورة النصر", "سورة المسد", "سورة الإخلاص", "سورة الفلق", "سورة النّاس"};

    public Pane(int width) {
        Object(
            orientation: Gtk.Orientation.HORIZONTAL
        );
        
    }
        construct {
            ayat_scrolled_window = new Gtk.ScrolledWindow(null, null);
            ayat_scrolled_window.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
            
            ayat_tree_view = new Gtk.TreeView();
            ayat_scrolled_window.add(ayat_tree_view);
            ayat_tree_store = new Gtk.TreeStore(1, typeof(string));
            ayat_tree_view.set_model(ayat_tree_store);
            ayat_list_column = new Gtk.TreeViewColumn();
            Gtk.CellRendererText aya_cell = new Gtk.CellRendererText();
            aya_cell.set_property("font", "Amiri Quran Regular 25");
            aya_cell.wrap_width = 800;
            aya_cell.wrap_mode = Pango.WrapMode.WORD;
            ayat_tree_view.append_column(ayat_list_column);
            ayat_list_column.pack_start(aya_cell, true);
            ayat_list_column.add_attribute(aya_cell, "text", 0);
            ayat_tree_view.enable_search = true;
            ayat_tree_view.set_direction(Gtk.TextDirection.RTL);
            
            
            


            //  Gtk.TextTagTable tag_table = new Gtk.TextTagTable();
            //  Gtk.TextBuffer buffer = new Gtk.TextBuffer(tag_table);
            //  Gtk.TextTag amiri = new Gtk.TextTag("amiri");
            //  tag_table.add(amiri);
            //  amiri.font = "Amiri Quran 18";
            //  Gtk.TextIter start;
            //  Gtk.TextIter end;
            
            //  quran_text_view = new Gtk.TextView();
            //  quran_text_view.set_direction(Gtk.TextDirection.RTL);
            //  text_scrolled_window.add(quran_text_view);
            
            
            Gtk.TreeIter iter;
            soura_tree_store = new Gtk.TreeStore(1, typeof(string));
            foreach (string soura in souras) {
                soura_tree_store.append(out iter, null);
                soura_tree_store.set(iter, 0, soura, -1);
            } 

            treeview_scrolled_window = new Gtk.ScrolledWindow(null, null);
            treeview_scrolled_window.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
            soura_tree_view = new Gtk.TreeView();
            soura_tree_view.set_size_request(190, -1);
            treeview_scrolled_window.add(soura_tree_view);
            soura_tree_view.set_model(soura_tree_store);
            soura_list_column = new Gtk.TreeViewColumn();
            var cell = new Gtk.CellRendererText();
            soura_tree_view.append_column(soura_list_column);
            soura_list_column.pack_start(cell, true);
            soura_list_column.add_attribute(cell, "text", 0);
            soura_tree_view.enable_search = true;
            soura_tree_view.set_direction(Gtk.TextDirection.RTL);
            //  soura_tree_view.columns_autosize();
            
            var selection = soura_tree_view.get_selection();
            selection.changed.connect(this.show_soura);

            this.pack1(ayat_scrolled_window, true, true);
            this.pack2(treeview_scrolled_window, false, true);
        }
        
        internal void show_soura() {
            Gtk.TreeModel selection_model;
            Gtk.TreeIter iter;
            Gtk.TreeSelection selection = soura_tree_view.get_selection();
            selection.get_selected(out selection_model, out iter);
            Gtk.TreePath selection_path = selection_model.get_path(iter);
            int[] selected_soura_index = selection_path.get_indices();
            int selected_soura = selected_soura_index[0];
            selected_soura = selected_soura + 1;
            string file_name = "";
            if (selected_soura < 10) {
                file_name = "00" + selected_soura.to_string();
            } 
            else if (selected_soura > 9 && selected_soura < 100) {
                file_name = "0" + selected_soura.to_string();
            }
            else {
                file_name = selected_soura.to_string();
            }
            GLib.File file = GLib.File.new_for_path("../quran-data/" + file_name + ".txt");

            try {
                ayat_tree_store.clear();
                FileInputStream @is = file.read();
                DataInputStream dis = new DataInputStream (@is);
                string line;
                Gtk.TreeIter aya_iter;
                while((line = dis.read_line()) != null) {
                    ayat_tree_store.append(out aya_iter, null);
                    ayat_tree_store.set(aya_iter, 0, line, -1);
                }
            } catch (Error e) {
                print ("Error: %s\n", e.message);
            }
        

                //  uint8[] content;
                //  string etag_out;
                //  file.load_contents(null, out content, out etag_out);
                //  buffer.set_text((string) content);
                //  buffer.get_bounds(out start, out end);
                //  buffer.apply_tag(amiri, start, end);
                //  quran_text_view.set_buffer(buffer);
            
            //  } catch (Error e) {
            //          print ("Error: %s\n", e.message);
            //  }

            
            //  selection_model.get_value(iter, 0, out selected_soura);
            //  print(selected_soura.get_string() + "\n");
        }
    }
