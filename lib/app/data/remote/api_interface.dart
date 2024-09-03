abstract class ApiInterface{
  static const baseUrl = "https://transitsnap-backend.onrender.com/api/v1";

  Future getApi({
    String? url,
    Map<String, String>? headers,
  });

  Future postApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future putApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future deleteApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });
}