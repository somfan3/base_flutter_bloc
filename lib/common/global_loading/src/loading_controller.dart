class LoadingController {
  late Function() show;
  late Function() hide;

  static LoadingController instance = LoadingController._init();

  factory LoadingController() => instance;

  LoadingController._init() {
    print("LoadingController was created!");
  }

  void initialize(
      {required Function() showCallback, required Function() hideCallback}) {
    show = showCallback;
    hide = hideCallback;
  }
}
