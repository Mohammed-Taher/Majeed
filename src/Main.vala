public const string APP_NAME = "Majeed";
public const string TERMINAL_NAME = "majeed";
public static int main(string[] args) {
	Environment.set_application_name(APP_NAME);
	Environment.set_prgname(APP_NAME);
	var app = new Application ();
	return app.run (args);
}
