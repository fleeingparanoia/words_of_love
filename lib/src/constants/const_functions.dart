String kAddHttpsIfNeeded(String url) {
  if (url[0] == "/") {
    return "https:" + url;
  }
  return url;
}
