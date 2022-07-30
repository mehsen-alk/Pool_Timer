abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {}

abstract class BaseViewModelInput {
  void start();

  void depose();
}

abstract class BaseViewModelOutput {}
