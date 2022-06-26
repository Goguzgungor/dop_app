abstract class BaseNavigationService {
  Future<void> navigateToPage({required String path, Object? arguments});
  Future<void> navigateToPageReplacement({required String path, Object? arguments});
  Future<void> navigateToPageClear({required String path, Object? object});
}
